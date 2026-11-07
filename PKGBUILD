# Maintainer: LunarEclipse <luna@lunareclipse.zone>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
#
# Based on: https://gitlab.archlinux.org/archlinux/packaging/packages/bluez/-/blob/e1e4545b40b3f0b212a1d3699d4f2a674f0b6aac/PKGBUILD
# With addition of: https://github.com/RealSupremium/bluez/commit/fadd6455d4e9716b6c724681e18cfb3d7a1704e4

pkgname='bluez-optional-force-active'
pkgdesc='Daemons for the bluetooth protocol stack'
pkgver=5.88
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('dbus' 'libical' 'systemd' 'alsa-lib' 'json-c' 'ell' 'python-docutils' 'python-pygments' 'cups' 'git')
provides=('bluez')
conflicts=('bluez')
source=(#https://www.kernel.org/pub/linux/bluetooth/${pkgname}-${pkgver}.tar.{xz,sign}
        # "git+https://github.com/bluez/bluez.git?signed#tag=$pkgver"
        "${pkgname}::git+https://github.com/bluez/bluez.git#tag=$pkgver"
	bluetooth.modprobe
	optional-force-active.patch)
b2sums=('debb4734eb5b59028a6194588c635652b8d170d74d2730d28cc60e0d4c01e682d594f9f65612c82a7ba2b60cc6b0fc362f4619846689fb8c24ebbece435b9637'
        '0ce33d13b796d4ae2fd688b17742b3a3055663b68a352b02720dac82bcfdaa47bf2ee2a034dfb8ef4ddf3f827bc58fe80548730939c2915f64864cea39c10170'
        '1cd3b264d4053ff32a79ab771ae595312246be51b2c2ee0e42ad1ca936b2a150ef294ee25aafde50c307cefce2cf8a659fd1ce567b4bf0a8aa70c42941292036')
# validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # Marcel Holtmann <marcel@holtmann.org>

prepare() {
  cd "${pkgname}"
  patch -Np1 -i ../optional-force-active.patch
  autoreconf -vfi
}

build() {
  cd "${pkgname}"
  ICAL_LIBS="-lical -licalvcal" \
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --with-dbusconfdir=/usr/share \
          --enable-btpclient \
          --enable-midi \
          --enable-sixaxis \
          --enable-mesh \
          --enable-hid2hci \
          --enable-experimental \
          --enable-datafiles \
          --enable-external-ell \
          --enable-library --enable-deprecated # libraries and these tools are deprecated
  make

  # fake installation to be seperated into packages
  make DESTDIR="${srcdir}/fakeinstall" install

  # add missing tools FS#41132, FS#41687, FS#42716
  for files in `find tools/ -type f -perm -755`; do
    filename=$(basename $files)
    install -Dm755 "${srcdir}"/"${pkgbase}"/tools/$filename "${srcdir}/fakeinstall"/usr/bin/$filename
  done

  for files in `find client/btpclient/ -type f -perm -755`; do
    filename=$(basename $files)
    install -Dm755 "${srcdir}"/"${pkgbase}"/client/btpclient/$filename "${srcdir}/fakeinstall"/usr/bin/$filename
  done
  

  # add man pages for the above tools
  # https://github.com/bluez/bluez/commit/44e3dd321e4be052bcde40939552b93b734538d3
  for manfile in `find doc/ -type f -regex '.*\.[1-8]'`; do
    section=$(echo $manfile | sed -E 's/.*\.([1-8])$/\1/')
    filename=$(basename $manfile)
    install -Dm644 "${srcdir}"/"${pkgbase}"/doc/$filename "${srcdir}/fakeinstall"/usr/share/man/man${section}/$filename
  done
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    # use copy so a new file is created and fakeroot can track properties such as setuid
    cp -av "${src}" "${dir}/"
    rm -rf "${src}"
  done
}

check() {
  cd "$pkgname"
  make check
}


package_bluez-optional-force-active() {
  depends=('systemd-libs' 'dbus' 'glib2' 'alsa-lib' 'glibc')
  backup=(etc/bluetooth/{main,input,network}.conf)

  _install fakeinstall/etc/bluetooth/main.conf
  _install fakeinstall/etc/bluetooth/input.conf
  _install fakeinstall/etc/bluetooth/network.conf
  _install fakeinstall/usr/lib/bluetooth/bluetoothd
  _install fakeinstall/usr/lib/systemd/system/bluetooth.service
  _install fakeinstall/usr/share/dbus-1/system-services/org.bluez.service
  _install fakeinstall/usr/share/dbus-1/system.d/bluetooth.conf
  _install fakeinstall/usr/share/man/man8/bluetoothd.8

  # bluetooth.service wants ConfigurationDirectoryMode=0555
  chmod -v 555 "${pkgdir}"/etc/bluetooth

  # add basic documention
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgbase}"/dbus-apis
  cp -a "${pkgbase}"/doc/*.txt "${pkgdir}"/usr/share/doc/"${pkgbase}"/dbus-apis/
  # fix module loading errors
  install -dm755 "${pkgdir}"/usr/lib/modprobe.d
  install -Dm644 "${srcdir}"/bluetooth.modprobe "${pkgdir}"/usr/lib/modprobe.d/bluetooth-usb.conf
  # load module at system start required by some functions
  # https://bugzilla.kernel.org/show_bug.cgi?id=196621
  install -dm755 "$pkgdir"/usr/lib/modules-load.d
  echo "crypto_user" > "$pkgdir"/usr/lib/modules-load.d/bluez.conf
}
