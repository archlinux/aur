# Maintainer:
# Contributor: Midov <midov@midov.pl>

_pkgname="matrix-mirage"
pkgname="$_pkgname-git"
pkgver=0.7.2.r0.g9a4ababd
pkgrel=2
pkgdesc='A fancy, customizable, keyboard-operable Matrix chat client for encrypted and decentralized communication.'
arch=('x86_64')
url='https://github.com/mirukana/mirage'
license=('LGPL3')

depends=(
  'hicolor-icon-theme'
  'libxss'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols2'

  # Runtime
  'python-hsluv'
  'python-matrix-nio'
  #   'python-aiofiles'
  'python-pymediainfo'
  'python-pyotherside'
  'python-sortedcontainers'
  'python-watchgod'

  'dbus-python'
  'python-appdirs'
  'python-async_generator'
  'python-cairosvg'
  'python-filetype'
  'python-hsluv'
  'python-lxml'
  'python-pillow'

  # AUR
  'python-html-sanitizer'
  'python-mistune1'
  'python-plyer'
  # 'python-pyfastcopy'
  'python-redbaron'
  #   'python-baron'
  #     'python-rply'
  'python-simpleaudio'
)

makedepends=(
  'cmake'
  'git'
)

provides=(
  'mirage-matrix'
  'matrix-mirage'
)
conflicts=(${provides[@]})

source=(
  "$_pkgname"::"git+$url"

  'RadialBarDemo'::'git+https://github.com/mirukana/RadialBarDemo'
  'SortFilterProxyModel'::'git+https://github.com/oKcerG/SortFilterProxyModel'
  'gel'::'git+https://github.com/Cutehacks/gel'
  'hsluv-c'::'git+https://github.com/hsluv/hsluv-c'
  'qsyncable'::'git+https://github.com/benlau/qsyncable'
)
sha256sums=(
  'SKIP'

  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  _submodules=(
    'submodules/RadialBarDemo'
    'submodules/SortFilterProxyModel'
    'submodules/gel'
    'submodules/hsluv-c'
    'submodules/qsyncable'
  )
  for submodule in ${_submodules[@]} ; do
    mkdir -p "$submodule"
    git submodule init ${submodule}
    git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
    git -c protocol.file.allow=always submodule update ${submodule}
  done

  sed -Ei 's@collections\.Mapping@collections.abc.Mapping@g' "$srcdir/$_pkgname/src/backend/utils.py"
}

build() {
  cd "$srcdir/$_pkgname"
  qmake PREFIX=/usr mirage.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install 
}
