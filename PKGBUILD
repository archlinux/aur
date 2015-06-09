# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Taken from M0Rf30 morf3089 at gmail dot com

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname#*-}, repo=vivid
# vercheck-launchpad: name=${pkgname#*-}

pkgname=lightdm-unity-greeter
_ubuntu_rel=0ubuntu1
pkgver=15.10.0
pkgrel=1
pkgdesc="The greeter (login screen) application for Unity. It is implemented as a LightDM greeter."
arch=(i686 x86_64)
url="https://launchpad.net/unity-greeter"
license=(GPL3 LGPL3)
groups=(unity)
depends=(cantarell-fonts gnome-doc-utils ido libindicator3 lightdm-ubuntu
         libcanberra libxext)
makedepends=(gnome-common gnome-doc-utils unity-settings-daemon imagemagick
             intltool librsvg vala)
optdepends=("ubuntu-themes: Ubuntu's Ambiance and Radiance themes"
            "ubuntu-wallpapers: Ubuntu's default wallpapers"
            "ttf-ubuntu-font-family: Ubuntu's default font")
install=unity-greeter.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname#*-}_${pkgver}-${_ubuntu_rel}.tar.xz"
        spawn_indicators.patch
        unity-greeter-indicators-start
        10-unity.defaults
        50-unity-greeter.rules
        logo.png)
sha512sums=('a81e5569c1fc1210cfe6ef3cf925b3ed22db9137884616068434d06c1ac381f81b9948dff93c24e5016f3852d0d77bf8309ed14ccc4db920a591521076cc6175'
            'a6b69114204d696edf8a420bce701471dfa3ed269f63eb4d26cc8361f1ef55e6967a0ea0bad4a7826d1037368ce1e3b3ee1bf5cd5989c39152c2d796326e0e04'
            'e43c177d0255af961bbf9198868e32a1a762bb70e117f80c3c2ce4b54d23f4955cc1c4c32b68751b021116f8e6d26133b24845c03ae459c2209e8313e28a0bc6'
            'ee5d1f17dddd99ba55bbaca8aff5e8487c9b9f7e1eef570d2adb3d2519e19ef437b160414468ef85a8c1b14af1eee23c714e2086291701edfbab2f43064e2cd7'
            '5d0f1b8221dfe02670df3ba88011dc0ce744bfd4205a9900dd8096de222358a740a384a47f13ed4e5b94e24d4a8ff5639117464c61a689dd7bd9025a0900f529'
            '4cc7e3600a8f5afc7edf574ccdb21dbbff9c7492a46b50c696fb7b38446829f2cc99ae029688e289da2100a9cac6ae0471cc8bac03f8db3799f9929a1e2f2679')

prepare() {
  cd "${pkgname#*-}-${pkgver}"

  # Apply Ubuntu patches
  for i in $(grep -v '#' debian/patches/series); do
    patch -p1 -i "debian/patches/${i}"
  done

  # Patch from unity-gentoo for spawning the indicator services since the
  # DBus activation method is deprecated
  patch -p1 -i ../spawn_indicators.patch

  # Use Arch Linux logo (retain the same 245px height as the Ubuntu logo)
  rm data/logo.png
  # Stupid segfaulting imagemagick...
  if ! convert -background none -resize 245 \
         /usr/share/archlinux/logos/archlinux-mono-white.svg \
         data/logo.png; then
    cp ../logo.png data/logo.png
  fi
}

build() {
  cd "${pkgname#*-}-${pkgver}"

  # Link against libm and libx11
  export CFLAGS+=" -lm -lX11"

  autoreconf -vfi
  intltoolize -f

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/lightdm

   make || :
   sed -i '1i#include <gtk/gtkx.h>' src/menubar.c
   make
}

package() {
  cd "unity-greeter-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install PolicyKit file for allowing the lightdm user to use NetworkManager
  # Note: PolicyKit no longer reads pkla files after version 0.107, so Ubuntu's
  # policy file won't work.
  install -dm700 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -m644 "${srcdir}/50-unity-greeter.rules" \
    "${pkgdir}/usr/share/polkit-1/rules.d/"
  #install -dm700 "${pkgdir}/var/lib/polkit-1/"
  #install -dm755 "${pkgdir}/var/lib/polkit-1/localauthority/10-vendor.d/"
  #install -m644 "${srcdir}/debian/unity-greeter.pkla" \
  #  "${pkgdir}/var/lib/polkit-1/localauthority/10-vendor.d/"

  # Install default GSettings/dconf settings for the guest account (requires
  # lightdm-ubuntu).
  install -dm755 "${pkgdir}/etc/guest-session/gsettings/"
  install -m644 "${srcdir}/10-unity.defaults" \
    "${pkgdir}/etc/guest-session/gsettings/"

  # Install LightDM configuration file to set the Unity greeter as the default
  install -dm755 "${pkgdir}/usr/share/lightdm/lightdm.conf.d/"
  install -m644 debian/50-unity-greeter.conf \
                "${pkgdir}/usr/share/lightdm/lightdm.conf.d/"

  # Install unity-gentoo's script for launcher the indicator services
  install -m755 "${srcdir}/unity-greeter-indicators-start" "${pkgdir}/usr/bin/"

  # Use language packs
  rm -r "${pkgdir}/usr/share/locale/"
}
