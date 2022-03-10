# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>

pkgname=boosteroid
pkgver=1.4.4
pkgrel=1
pkgdesc="Boosteroid client desktop"
arch=('x86_64')
url="https://boosteroid.com/downloads"
license=('custom')
depends=("libva" "libvdpau" "libxcb" "traceroute" "ocl-icd" "pcre2")
makedepends=("binutils" "tar" "coreutils")

source=("boosteroid-install-x64.md5")
md5sums=("4a86840339f151b05e60347362ced37f")

prepare() {
  cd "$srcdir"
  # Boosteroid blocks some user agents, for now wget seems to work while curl doesn't
  wget "https://boosteroid.com/linux/installer/boosteroid-install-x64.deb" -O boosteroid-install-x64.deb
  md5sum -c boosteroid-install-x64.md5 > /dev/null
  msg2 "Decompressing Debian package..."
  ar xv "boosteroid-install-x64.deb" > /dev/null
  tar -xf data.tar.bz2 > /dev/null
  tar -xf control.tar.gz > /dev/null
  msg2 "Checking archive integrity..."
  md5sum -c md5sums > /dev/null
  msg2 "Patching files..."
  sed -i "s/Exec=.*/Exec=\/usr\/bin\/$pkgname/g" usr/share/applications/Boosteroid.desktop
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/bin
  install -m755 "opt/Boosteroid Games S.R.L./bin/Boosteroid" "$pkgdir"/usr/bin/"$pkgname"
  install -dm755 "$pkgdir"/usr/share/{applications,icons/Boosteroid}
  install -m644 usr/share/applications/Boosteroid.desktop "$pkgdir"/usr/share/applications/Boosteroid.desktop
  install -m644 usr/share/icons/Boosteroid/icon.svg "$pkgdir"/usr/share/icons/Boosteroid/icon.svg
}

