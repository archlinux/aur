
pkgname=btrfs-data-recovery-git
pkgver=v1.0.0.r6.g03a3070
pkgrel=1
pkgdesc="Tools for btrfs data recovery"
arch=(x86_64)
url=https://github.com/davispuh/btrfs-data-recovery
license=(UNLICENSE)
depends=(liblphobos sqlite ruby ruby-digest-crc ruby-xxhash ruby-sqlite3 ruby-rake)
makedepends=(git rubygems ldc dub)
source=("git+https://github.com/davispuh/btrfs-data-recovery")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/btrfs-data-recovery"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/btrfs-data-recovery"
    dub build --build=release --compiler=ldc
}

package() {
    cd "$srcdir/btrfs-data-recovery"

    local gemdir="$(gem env gemdir)"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir$gemdir/gems/btrfs-recovery-1.0.0"

   cp ./btrfs-scanner "$pkgdir/usr/bin/"
   cp ./btrfs-recovery-map "$pkgdir/usr/bin/"

   cp -R ./lib "$pkgdir$gemdir/gems/btrfs-recovery-1.0.0/"
   cp ./bin/btrfs-fixer.rb "$pkgdir/usr/bin"
   sed -i "s|require_relative '../lib/btrfs/cli'|require '$gemdir/gems/btrfs-recovery-1.0.0/lib/btrfs/cli'|" "$pkgdir/usr/bin/btrfs-fixer.rb"
}

