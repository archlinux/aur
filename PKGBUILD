# Maintainer: Dadoum <contact@dadoum.ml>
# Contributor: 1Conan <me@1conan.com>

pkgname=checkra1n
pkgver=0.10.2
pkgrel=2
pkgdesc="checkra1n is a semi-tethered jailbreak, developed primarily by Luca Todesco (qwertyoruiop). It's based on the checkm8 bootrom exploit released by axi0mx. checkra1n supports iOS 12.3 and newer."
license=('unknown')
url="https://checkra.in"
conflicts=('checkra1n-cli')
provides=('checkra1n-cli')
arch=('x86_64')
depends=(
  'glibc>=2.24'
  'ncurses5-compat-libs>=6.0'
  'pango>=1.37.0'
  'atk>=2.15.0'
  'gdk-pixbuf2>=2.30.0'
  'glib2>=2.45.0'
  'fontconfig>=2.11.1'
  'freetype2>=2.2.1'
  'gtk3>=3.18.0'
  'libusb>=1.0.19'
  'libusbmuxd>=2.0.1'
  'libplist>=2.1.0'
  'libirecovery>=1.0.0'
  'usbmuxd>=1.1.0'
)
options=('!strip')
source=(https://assets.checkra.in/debian/checkra1n_${pkgver}_amd64.deb)
md5sums=('214e0e25935d9d2dedc57b5659bcb4a0')
sha1sums=('d020d0fa2c783f69b50e9e8229831f08e42f7e99')
sha256sums=('229f93e0771d64455b67b46a7a09f0c7e43601f7e4f17259e520553370945dae')
makedepends=(
  'patchelf'
)

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  echo "checkra1n requires old versions of libirecovery, libplist and libusbmuxd. "
  echo "So, we need to create some symlinks to old libraries."
  if whereis libusbmuxd-2.0.so.6 | grep "^libusbmuxd-2.0.so: .*/libusbmuxd-2.0.so.6" > /dev/null; then
    echo "Symlinking libusbmuxd"
    nlb=$(whereis libusbmuxd-2.0.so.6 | cut -d' ' -f2)
    new_library=${nlb// / }
    library_path=$(dirname "$new_library")
    mkdir -p  "$pkgdir$library_path/"
    ln -sr "$pkgdir$library_path/$(basename $new_library)" "$pkgdir$library_path/libusbmuxd.so.6"
  fi
  if whereis libirecovery-1.0.so.3 | grep "^libirecovery-1.0.so: .*/libirecovery-1.0.so.3" > /dev/null; then
    echo "Symlinking libirecovery"
    new_library=$(whereis libirecovery-1.0.so.3 | cut -d' ' -f2)
    library_path=$(dirname "$new_library")
    echo "library path: $library_path;  new library: $new_library}"
    mkdir -p  "$pkgdir$library_path/"
    ln -sr "$pkgdir$library_path/$(basename $new_library)" "$pkgdir$library_path/libirecovery.so.3"
  fi
  if whereis libplist-2.0.so.3 | grep "^libplist-2.0.so: .*/libplist-2.0.so.3" > /dev/null; then
    echo "Symlinking libplist"
    nlb=$(whereis libplist-2.0.so.3 | cut -d' ' -f2)
    new_library=${nlb// / }
    library_path=$(dirname "$new_library")
    mkdir -p  "$pkgdir$library_path/"
    ln -sr "$pkgdir$library_path/$(basename $new_library)" "$pkgdir$library_path/libplist.so.3"
  fi
}

