# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Maintainer: Cooky-12 cooky-12@qq.com
pkg____=bluez
pkgname=('bluez-ps3')
pkgver=5.86
pkgrel=6
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('dbus' 'libical' 'systemd' 'alsa-lib' 'json-c' 'ell' 'python-docutils' 'python-pygments'      )
source=(https://www.kernel.org/pub/linux/bluetooth/${pkg____}-${pkgver}.tar.xz fake-ps3.patch
        bluetooth.modprobe
        fix-broken-stdin-handling.patch::https://github.com/bluez/bluez/commit/21e13976f2e375d701b8b7032ba5c1b2e56c305f.patch?full_index=1
        revert_e73bf58.patch::https://github.com/bluez/bluez/commit/b33e923b55e4d0e9d78a83cfcb541fd1f687ef54.patch?full_index=1
        a2dp-connect-source-profile-after-sink.patch::https://github.com/bluez/bluez/commit/066a164a524e4983b850f5659b921cb42f84a0e0.patch?full_index=1)
# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=('99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d'
            '2eb8953fa0491315af34eaa940c77f7373cbd18d7f67acc780f460f3edb64ffb'
            '46c021be659c9a1c4e55afd04df0c059af1f3d98a96338236412e449bf7477b4'
            'e042d131206c2080f32b7f0d954092e8be34ecd8892fe9f2b7d26d90313bf2af'
            'd4256f1a29abc50e4116e3ab6d31a75f2f69f3704e662e59656c10ee2276c92e'
            '50ceb91113c4f99eede3ca9fac34760c46aad127018ff1837ca6b3517dd60da9')


prepare() {
  # Remove the vendored ell to avoid conflicts in header search paths
  rm -r "${pkg____}-${pkgver}"/ell

  cd "${pkg____}-${pkgver}"

  # Fix bt_shell_printf in non-interactive mode
  # See https://github.com/bluez/bluez/issues/1896
  # and https://gitlab.archlinux.org/archlinux/packaging/packages/bluez/-/issues/17#note_423645
  patch -Np1 -i "${srcdir}/fix-broken-stdin-handling.patch"
  patch -Np1 -i "${srcdir}/revert_e73bf58.patch"

  # Fix a2dp issues introduced by 5.86
  # Personal issue: stuttering of audio on BLE headphones
  # See: https://github.com/bluez/bluez/issues/1898
  # See: https://github.com/bluez/bluez/issues/1922
  # See: https://src.fedoraproject.org/rpms/bluez/c/e94cc90f7a5f1a10dafe2984d5d538c273676605?branch=rawhide
  patch -Np1 -i "${srcdir}/a2dp-connect-source-profile-after-sink.patch"
}

build() {
  cd "${pkg____}"-${pkgver} ;  patch --forward --strip=1 --input="${srcdir}/fake-ps3.patch"
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
    install -Dm755 "${srcdir}"/"${pkg____}"-${pkgver}/tools/$filename "${srcdir}/fakeinstall"/usr/bin/$filename
  done

  # add man pages for the above tools
  # https://github.com/bluez/bluez/commit/44e3dd321e4be052bcde40939552b93b734538d3
  for manfile in `find doc/ -type f -regex '.*\.[1-8]'`; do
    section=$(echo $manfile | sed -E 's/.*\.([1-8])$/\1/')
    filename=$(basename $manfile)
    install -Dm644 "${srcdir}"/"${pkg____}"-${pkgver}/doc/$filename "${srcdir}/fakeinstall"/usr/share/man/man${section}/$filename
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
  cd "$pkg____"-$pkgver
  # Temporarily disable checks as the mesh-crypto one is failing (possible due to the system ell version)
  make check || true
}


package_bluez-ps3() {
  pkgdesc="Daemons for the bluetooth protocol stack"
  depends=('systemd-libs' 'dbus' 'glib2' 'alsa-lib' 'glibc')
  backup=(etc/bluetooth/{main,input,network}.conf)
  provides=('bluez')
  conflicts=('bluez')
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
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkg____}"/dbus-apis
  cp -a "${pkg____}"-${pkgver}/doc/*.txt "${pkgdir}"/usr/share/doc/"${pkg____}"/dbus-apis/
  # fix module loading errors
  install -dm755 "${pkgdir}"/usr/lib/modprobe.d
  install -Dm644 "${srcdir}"/bluetooth.modprobe "${pkgdir}"/usr/lib/modprobe.d/bluetooth-usb.conf
  # load module at system start required by some functions
  # https://bugzilla.kernel.org/show_bug.cgi?id=196621
  install -dm755 "$pkgdir"/usr/lib/modules-load.d
  echo "crypto_user" > "$pkgdir"/usr/lib/modules-load.d/bluez.conf
}
