# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Maik Broemme <mbroemme@libmpq.org>
_pkgbase="media_build_experimental"
pkgname="media-build-experimental-dkms"
pkgdesc="Oliver Endriss experimental media tree as DKMS"
pkgver=r501.82186b8b60da
pkgrel=1
arch=("i686" "x86_64")
url="http://linuxtv.org/hg/~endriss/media_build_experimental"
license=("GPL")
depends=("dkms")
makedepends=('mercurial' 'linux-headers' 'wget')
replaces=('digitaldevices-dvb-drivers' 'dvbsky-dvb-drivers' 'technotrend-dvb-drivers')
conflicts=('digitaldevices-dvb-drivers' 'dvbsky-dvb-drivers' 'technotrend-dvb-drivers')
provides=('dddvb-dkms')
install="${pkgname}.install"
source=("hg+http://linuxtv.org/hg/~endriss/$_pkgbase")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir"
  echo "PACKAGE_NAME=\"$_pkgbase\"" > dkms.conf
  echo "PACKAGE_VERSION=\"$pkgver\"" >> dkms.conf
  echo 'AUTOINSTALL="yes"' >> dkms.conf
  echo 'CHECK_MODULE_VERSION="no"' >> dkms.conf
  echo 'MAKE="make"' >> dkms.conf
  echo 'CLEAN="make clean"' >> dkms.conf

  cd "$srcdir/$_pkgbase"
  make download
  make untar

  sed "/scripts\/rmmod.pl/d" -i experimental/v4l-dvb-saa716x/v4l/Makefile
  sed "/scripts\/rmmod.pl/d" -i v4l/Makefile
}

build() {
  cd "$srcdir/$_pkgbase"
  make

  # Borrowed from dahdi-linux
  let "module_number=0" || true
  for file in $(find ./ -type f -name "*.ko"); do
        MODULE_LOCATION=$(dirname $file | cut -d\/ -f 2-)
        echo "BUILT_MODULE_NAME[$module_number]=\"$(basename $file .ko)\"" >> ../dkms.conf
        echo "BUILT_MODULE_LOCATION[$module_number]=\"$MODULE_LOCATION\"" >> ../dkms.conf
        echo "DEST_MODULE_LOCATION[$module_number]=\"/extramodules/$pkgname\"" >> ../dkms.conf
        let "module_number=${module_number}+1" || true
  done

  make clean
}

package() {
  install -D -m 0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"

  cd "$srcdir/$_pkgbase"

  # Delete hardlinks.
  find -type f \! -links 1 -delete

  cp -a * "$pkgdir/usr/src/$_pkgbase-$pkgver"
}
