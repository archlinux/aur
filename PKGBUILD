_pkgname="dolphin"
pkgname="$_pkgname-tabopts-git"
pkgver=23.04.2.r3.gbb08c70a9
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
arch=(i686 x86_64)
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=(LGPL)
depends=(
  'baloo-widgets'
  'kactivities'
  'kcmutils'
  'kio-extras'
  'knewstuff'
  'kparts'
  'kuserfeedback'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
  'purpose: share context menu'
)
groups=(kde-applications kde-system)
provides=("$_pkgname" "$_pkgname-git")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+https://invent.kde.org/system/dolphin.git"

  # add tab options
  # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
  "https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
  _file='src/org.kde.dolphin.appdata.xml'

  _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  _version=$(
    echo "$_line" | sed -E "s@$_regex@\1@"
  )
  _commit=$(
    git log -S "$_line" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  _revision=$(
    git rev-list --count $_commit..HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  echo "$_version.r$_revision.g$_hash"
}

prepare() {
  cd "$srcdir/$_pkgname"

  for p in "$srcdir"/*.patch ; do
    patch -Np1 -F100 -i "$p"
  done
}

build() {
  cmake -B build -S "$_pkgname" \
      -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
