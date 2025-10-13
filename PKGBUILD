# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=ruby-github-markup-git
_gemname=${pkgname#ruby-}
_dirname=markup
pkgver=5.0.1.r69.g2b0e7f2
pkgrel=1
pkgdesc='The code GitHub uses to render README.markup'
arch=('any')
url='https://github.com/github/markup'
license=('MIT')
depends=('ruby' 'ruby-rdoc')
optdepends=('ruby-redcarpet: HTML'
            'ruby-redcloth: Textile'
            'asciidoctor: AsciiDoc')
makedepends=('git')
provides=('ruby-github-markup')
conflicts=('ruby-github-markup')
options=(!emptydirs)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_dirname

  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g' |
      sed 's/^v//' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $_dirname

  gem build "$_gemname.gemspec"
}

package() {
  cd $_dirname

  _gemdir="$(ruby -e'puts Gem.default_dir')"
  _release=$(gem build "$_gemname.gemspec" | grep Version | cut -d' ' -f4)

  gem install --ignore-dependencies --no-user-install --no-document \
    -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$_release.gem"

  rm "$pkgdir/$_gemdir/cache/$_gemname-$_release.gem"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$_release/test"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$_release/script"
  rm -r "$pkgdir/$_gemdir/gems/$_gemname-$_release/"{.dockerignore,.github/,.gitignore,.kick}
  rm "$pkgdir/$_gemdir/gems/$_gemname-$_release/"{CODE_OF_CONDUCT.md,CONTRIBUTING.md,Dockerfile,Rakefile}

  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete

  install -Dm 644 "$pkgdir/$_gemdir/gems/$_gemname-$_release/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

