# Maintainer: Xinc

pkgname=unity-greeter
pkgver=22.04.1
pkgrel=1
pkgdesc="The greeter (login screen) application for Unity. It is implemented as a LightDM greeter."
arch=(x86_64)
url="https://launchpad.net/unity-greeter"
license=(GPL)
depends=(networkmanager humanity-icon-theme pixman dbus freetype2 ttf-ubuntu-font-family gnome-desktop at-spi2-core unity-indicator-sound unity-indicator-power pango libxext libx11 gdk-pixbuf2 cairo libxrandr xorg-xhost unity-indicator-session unity-indicator-keyboard unity-indicator-datetime unity-indicator-application dconf atk lightdm gtk3-ubuntu ido libcanberra libindicator-gtk3)
makedepends=(patch gnome-common glibc systemd glib2)
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/$pkgver-0ubuntu2/"$pkgname"-"$pkgver"_0ubuntu2.tar.xz"
        environment-variables.patch
        unity-greeter.gsettings-override)
sha512sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../../environment-variables.patch
  sed -i -e "s/ indicator-power//" src/unity-greeter.vala
  sed -i -e "/command_line_async (\"nm-applet\")/d" src/unity-greeter.vala
  sed -i -e "s/\"system-ready\"/\"dialog-question\"/" src/unity-greeter.vala
  sed -i -e "s:/usr/lib/at-spi2-core/at-spi-bus-launcher:/usr/libexec/at-spi-bus-launcher:" src/unity-greeter.vala
  > po/LINGUAS
}

build() {
 cd "${pkgname}"-$pkgver
 ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/"${pkgname}" --disable-static
 make
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}"-$pkgver install
  local gschema="10_unity-greeter.gschema.override" gschema_dir="/usr/share/glib-2.0/schemas"
  cp ../../../unity-greeter.gsettings-override $gschema_dir/10_unity-greeter.gschema.override
  sed -i -e "/play-ready-sound/d" "${ED}${gschema_dir}/${gschema}"
  sed -i -e "/com.canonical.unity-greeter:unity-greeter/,+1 d" "${ED}${gschema_dir}/${gschema}"
  chown root:polkitd /var/lib/polkit-1/localauthority/10-vendor.d/unity-greeter.pkla
  find "${ED}" -name '*.la' -delete /var/lib/polkit-1/localauthority/10-vendor.d/debian/unity-greeter.pkla
  if line=$(grep -s -m 1 -e "user-session" "${EROOT}/etc/lightdm/lightdm.conf"); then
	  sed -i -e "s/user-session=.*/user-session=unity/" "${EROOT}/etc/lightdm/lightdm.conf"
  else
	  echo "user-session=unity" >> "${EROOT}/etc/lightdm/lightdm.conf"
  fi
  sed -e 's|#greeter-session=|greeter-session=unity-greeter|' -i vapi/Makefile
}




