# Maintainer: envolution
# Contributor: Miguel Vazquez https://github.com/mikisvaz
# Contributor: Vojtěch Aschenbrenner <v@asch.cz>

_gemname=lockfile
pkgname=ruby-lockfile
#this version is altered by the patches, not the original author.  See link below
pkgver=2.1.8
pkgrel=1
pkgdesc='A Ruby library for creating lockfiles'
arch=(any)
url='https://github.com/ahoward/lockfile'
license=(Ruby)
depends=(ruby)
options=(!emptydirs)
_tag='20ab06f29bda69b9773d799510d00585b6a27e3b'
source=(
  "$pkgname-$pkgver::git+https://github.com/ahoward/lockfile.git#tag=${_tag}"
  "semiphore.patch"  # https://github.com/mikisvaz/lockfile/tree/8c6dd8177f569e4bb555703abfb26d24ae141865
)
sha1sums=('1fe94eabbe9030b9d56590c0aa0ade80c5764d12'
          '8526ba6d7860b5e7d137f5c64dd3087e0ae5fff6')

build() {
  cd "${pkgname}-${pkgver}"

  # Apply patch if necessary
  patch -p1 < "${srcdir}/semiphore.patch"

  # Build the gem directly from the gemspec
  gem build "${_gemname}.gemspec"
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install the gem to the appropriate directory
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" "${_gemname}-${pkgver}.gem"

  # Install binaries and docs
  install -Dm755 "bin/rlock" "$pkgdir/usr/bin/rlock"
  install -Dm644 "doc/rlock.help" "$pkgdir/usr/share/doc/${pkgname}/rlock.help"
  install -Dm644 "README" "$pkgdir/usr/share/doc/${pkgname}/README"
  
  # Install samples
  install -d "$pkgdir/usr/share/${pkgname}/samples"
  cp -r samples/* "$pkgdir/usr/share/${pkgname}/samples/"
}

# vim:set ts=2 sw=2 et:

