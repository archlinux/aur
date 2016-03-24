# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Mikkel Kroman <mk@maero.dk>

pkgname=crystal-git
pkgver=0.14.2.r20.g85bccef
_last_release="0.14.2-1"
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('gc' 'libatomic_ops' 'pcre' 'libevent')
makedepends=('git' 'libxml2' 'llvm35')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git')
optdepends=('shards: To make the crystal deps command work'
            'libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
conflicts=('crystal')
provides=('crystal')
source=("git://github.com/crystal-lang/crystal.git")
source_x86_64+=("https://github.com/crystal-lang/crystal/releases/download/${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-i686.tar.gz")
source_x86_64+=("https://github.com/crystal-lang/crystal/releases/download/${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-x86_64.tar.gz")

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

  install -Dm644 etc/completion.bash "$pkgdir/usr/share/bash-completion/completions/crystal"
  install -Dm644 etc/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_crystal"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('SKIP')
sha256sums_x86_64=('12a8b8b85182a98cc162ae56452ea1226d339964076aef1fd3aa85b424608bf7'
                   'd4b96e576473a76e17175439c2e380b07feeffbbc5cb07490a96ea4dc533b922')
