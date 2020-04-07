# Maintainer: dexterlb <dexterlb@qtrp.org>

_pkgname=roc
pkgname=${_pkgname}-git
pkgver=r930.778c329
pkgrel=4
pkgdesc="Real-time audio streaming over network"
arch=('x86_64' 'i686' 'armv6l' 'armv7l' 'aarch64' 'armv7h' 'armv6h')
conflicts=(roc)
provides=(roc)
url="https://roc-project.github.io/"
license=('Mozilla')
depends=('openfec' 'ragel' 'libuv' 'libunwind' 'sox')
makedepends=('scons' 'clang' 'llvm' 'gengetopt')
source=('git+https://github.com/roc-project/roc.git'
	'config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=5256817ace8493502ec88501a19e4051c2e220b0')
sha256sums=('SKIP'
            'c081ced2d645e3b107fbf864529cc0e5954399a09b87a4f1d300470854b6dea4')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_run_scons() {
  local opts=(
    --prefix="${pkgdir}"/usr
    --disable-tests --disable-examples
    --with-openfec-includes=/usr/include/openfec
  )

  if [[ $(uname -m) == x86_64 ]]; then
    # pulseaudio support only seems to work on x86_64
    opts+=(
      --build-3rdparty=pulseaudio
      --enable-pulseaudio-modules
    )
  fi

  scons ${opts[@]} "${@}"
}

build() {
  cd "${_pkgname}"
  if [ -d 3rdparty ]; then
    _run_scons
  else
    if ! _run_scons; then
      # some libraries bundled as 3rd party components ship an outdated config.guess
      # file, which fails to detect some ARM systems

      find 3rdparty -name config.guess -exec cp -vf config.guess '{}' \;
    fi
    _run_scons
  fi
}

package() {
  cd "${_pkgname}"
  _run_scons install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
