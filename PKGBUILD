# Maintainer: sumt <sumt at sci dot fi>
# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=image_optim-git
_pkgname=${pkgname%-git}
pkgver=v0.25.0.r0.g4334309
pkgrel=1
pkgdesc='Optimize (lossless compress, optionally lossy) images (jpeg, png, gif, svg) using external utilities.'
arch=('any')
url='https://github.com/toy/image_optim'
license=('MIT')
depends=('advancecomp'
         'gifsicle'
         'jhead'
         'jpegoptim'
         'libjpeg-turbo'
         'optipng'
         'pngcrush'
         'pngquant'
	 'ruby'
         'ruby-exifr'
         'ruby-fspath'
         'ruby-image_size'
         'ruby-in_threads'
         'ruby-progress')
optdepends=('pngout: for lossless PNG compress'
            'nodejs-svgo: for optimizing SVG vector graphics files'
            'jpeg-archive: for lossy JPEG compression with jpeg-recompress')
makedepends=('git' 'ruby')
provides=(${_pkgname}=$pkgver)
conflicts=(${_pkgname})
options=('!emptydirs')
source=("$pkgname::git+https://github.com/toy/image_optim.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  gem build $_pkgname.gemspec
}

package() {
  cd "$pkgname"
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    $_pkgname-*.gem
  rm -rf "${pkgdir}${_gemdir}/cache"
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
