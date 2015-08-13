# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Mikkel Kroman <mk@maero.dk>

pkgname=crystal-git
pkgver=0.7.6.r0.geb13f75
_last_release="0.7.6-1"
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('libunwind' 'gc-static' 'llvm' 'libatomic_ops' 'pcre' 'libpcl' 'libevent')
makedepends=('libxml2')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git')
optdepends=('libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
makedepends=('git')
conflicts=('crystal')
provides=('crystal')
source=("git://github.com/manastech/crystal.git")
source_x86_64+=("https://github.com/manastech/crystal/releases/download/${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-i686.tar.gz")
source_x86_64+=("https://github.com/manastech/crystal/releases/download/${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-x86_64.tar.gz")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  make release=1 \
       PATH="$srcdir/${pkgname/-git/}-$_last_release/bin:$PATH" \
       CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
       CRYSTAL_CONFIG_PATH="libs:/usr/lib/crystal"
  make doc
}

check() {
  cd "$srcdir/${pkgname/-git/}"

  make spec CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
            CRYSTAL_CONFIG_VERSION="$pkgver"
}

package() {
  cd "$srcdir/${pkgname/-git/}"

  # /usr/bin/crystal                compiled executable
  # /usr/lib/crystal/               compiler src & core libs
  # /usr/share/doc/crystal/api/     api docs
  # /usr/share/doc/crystal/samples/ samples

  install -Dm755 ".build/crystal" "$pkgdir/usr/bin/crystal"

  install -dm755 "$pkgdir/usr/lib"
  cp -av src "$pkgdir/usr/lib/crystal"

  install -dm755 "$pkgdir/usr/share/doc/crystal"
  cp -av doc     "$pkgdir/usr/share/doc/crystal/api"
  cp -av samples "$pkgdir/usr/share/doc/crystal/"

  install -Dm644 etc/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_crystal"
}

sha256sums=('SKIP')
sha256sums_x86_64=('6f9d8d7bb3795c590c49fc7da33110ca9977323ff1bd61fbace589ddb44f57b0'
                   '5fd6781ecf7243d2a71ec9c1aa93ad6a1fadef0d231c329280720c271183c1ff')
