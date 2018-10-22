# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=picard-plugins-git
pkgver=2.0.r401.3921eff
_pkgver=2.0
_gitbranch=2.0
pkgrel=1
pkgdesc="plugins from picard-plugins repository"
arch=('any')
url="https://picard.musicbrainz.org/plugins/"
license=('GPL')
depends=(
  'picard'
  'python-aubio'  # Required by `bpm` plugin
)
conflicts=('picard-plugins-v2-git')
replaces=('picard-plugins-v2-git')
source=("git+https://github.com/metabrainz/picard-plugins.git#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/picard-plugins"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/picard-plugins"
  python generate.py "${_gitbranch}"
}

package() {
  pythonver=$(python --version | sed -E 's/Python (3\.[0-9]+)\..*/\1/')
  plugindir="${pkgdir}/usr/lib/python${pythonver}/site-packages/picard/plugins"
  install -d "$plugindir"
  # copy all plugins
  cp "$srcdir/picard-plugins/build/$_gitbranch/"*.zip "$plugindir"
}

# vim:set ts=2 sw=2 et:
