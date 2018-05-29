# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=kaitai-struct-visualizer-git
pkgver=0.8.r56.g078d45b
pkgrel=1
pkgdesc='Advanced hex viewer and binary structure exploration tool (visualizer) using Kaitai Struct ksy files'
url='http://kaitai.io'
arch=('x86_64')
license=('GPL')
depends=('ruby' 'ruby-kaitai-struct')
makedepends=('git' 'ruby-rdoc')
optdepends=()
backup=()
source=("${pkgname}::git+https://github.com/kaitai-io/kaitai_struct.git")
md5sums=('SKIP')
provides=('kaitai-struct-visualizer')
conflicts=('kaitai-struct-visualizer')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  # Pull in submodules
  git submodule update --init visualizer/
}

build() {
  # Build the kaitai-visualizer gem
  cd "${srcdir}/${pkgname}/visualizer"
  gem build kaitai-struct-visualizer.gemspec
}

# Package the kaitai-visualizer sources into $pkgdir
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=kaitai-struct-visualizer
package() {
  cd "${pkgdir}"

  local _gemdir="$(ruby -e'puts Gem.default_dir')" # Get default ruby library directory for current ruby version
  local _vissrcdir="${srcdir}/${pkgname}/visualizer" # Source directory for kaitai visualizer files
  local _versionrb="${_vissrcdir}/lib/kaitai/struct/visualizer/version.rb" # Ruby file that contains current visualizer version
  local _gemver="$(grep -o "VERSION.*" $_versionrb | sed -r "s/VERSION = '(.*)'$/\1/")" # Grep out the visualizer version

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${_vissrcdir}/kaitai-struct-visualizer-${_gemver}.gem"
  rm "$pkgdir/$_gemdir/cache/kaitai-struct-visualizer-${_gemver}.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/kaitai-struct-visualizer-${_gemver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
