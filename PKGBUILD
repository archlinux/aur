# Maintainer: David Runge <dvzrv@archlinux.org>

_name=helm
_pkgname=$_name-synth
pkgbase=helm-synth-git
pkgname=(helm-synth{,-common,-lv2,-standalone,-vst}-git)
pkgver=0.9.0.r21.gabdedd52
pkgrel=1
pkgdesc="A virtual analog poly synth LV2 and VST2 plugin and standalone application (git version)"
arch=(x86_64)
url="https://tytel.org/helm/"
license=(GPL3)
makedepends=(
  alsa-lib
  freetype2
  git
  hicolor-icon-theme
  jack
  libxcursor
  libglvnd
  libx11
  libxext
  libxinerama
  lv2
)
source=(
  "$_name::git+https://github.com/mtytel/helm.git"
  $_pkgname-gcc91.patch
  $_pkgname-0.9.0-fix-compile-error.patch
  $_pkgname-0.9.0-rename_helm-synth.patch
)
sha256sums=('SKIP'
            '8a7e45210cef0af82cf8fa857c2219ab8c6e1eb3279ac0f7bc6e7c3546418f08'
            '5748adb588172c621538ad6f672096b17ff4a0672e4fe43a651a4758fb3feb15'
            '4f41a6616720fd9665a511c016ac9b683c721fa77226721ddd2bec35fadc16a1')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

pkgver() {
  cd $_name
  local ver="$(grep 'JUCERPROJECT.*version' helm.jucer | sed 's/.*version=\"\(.*\)\".*/\1/')"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


prepare() {
  # gcc > 9.1 fixes:
  # https://github.com/mtytel/helm/pull/233
  patch -Np1 -d $_name -i ../$_pkgname-gcc91.patch
  # https://github.com/Jikstra/helm/pull/1
  patch -Np1 -d $_name -i ../$_pkgname-0.9.0-fix-compile-error.patch
  # rename to helm-synth as (kubernetes) helm will be in the repos
  patch -Np1 -d $_name -i ../$_pkgname-0.9.0-rename_helm-synth.patch
  # prevent from linking against libcurl.so for no reason
  sed -e 's/libcurl //g' -i $_name/{builds/linux/{LV2,VST},standalone/builds/linux}/Makefile*
}

build() {
  make \
    -C $_name \
    CONFIG=Release \
    PREFIX=/usr \
    standalone \
    lv2 \
    vst
}

package_helm-synth-git() {
  local make_options=(
  )
  depends=(
    $_pkgname-lv2-git=$pkgver
    $_pkgname-standalone-git=$pkgver
    $_pkgname-vst-git=$pkgver
  )
  provides=(helm-synth)
  conflicts=(helm-synth)

  make \
    -C $_name \
    DESTDIR="$pkgdir/" \
    VSTDIR="$pkgdir/usr/lib/vst" \
    install_lv2 \
    install_standalone \
    install_vst

  (
    cd "$pkgdir"

    # make sure that find-libdeps is able to find dependencies:
    # https://gitlab.archlinux.org/archlinux/devtools/-/issues/102
    find usr/lib/lv2 -type f -iname "*.so" -exec chmod +x {} \;

    _pick $_pkgname-common-git usr/share/doc
    _pick $_pkgname-common-git usr/share/$_pkgname

    _pick $_pkgname-lv2-git usr/lib/lv2

    _pick $_pkgname-standalone-git usr/bin
    _pick $_pkgname-standalone-git usr/share/{applications,icons,man}

    _pick $_pkgname-vst-git usr/lib/vst
  )
}

package_helm-synth-common-git() {
  pkgdesc+=" - common files"
  provides=($_pkgname-common=$pkgver)
  conflicts=($_pkgname-common)

  mv -v $_pkgname-common-git/* "$pkgdir"
}

package_helm-synth-lv2-git() {
  pkgdesc+=" - LV2 plugin"
  groups=(
    pro-audio
    lv2-plugins
  )

  depends+=(
    alsa-lib libasound.so
    freetype2 libfreetype.so
    gcc-libs
    glibc
    helm-synth-common=$pkgver
    libglvnd
    libx11
    libxext
    libxinerama
    lv2-host
  )
  provides=($_pkgname-lv2)
  conflicts=($_pkgname-lv2)

  mv -v $_pkgname-lv2-git/* "$pkgdir"
}

package_helm-synth-standalone-git() {
  pkgdesc+=" - standalone"
  groups=(
    pro-audio
  )
  depends=(
    alsa-lib libasound.so
    freetype2 libfreetype.so
    gcc-libs
    glibc
    helm-synth-common=$pkgver
    hicolor-icon-theme
    libglvnd
    libx11
    libxext
    libxinerama
  )
  provides=($_pkgname-standalone)
  conflicts=($_pkgname-standalone)

  mv -v $_pkgname-standalone-git/* "$pkgdir"
}

package_helm-synth-vst-git() {
  pkgdesc+=" - VST plugin"
  groups=(
    pro-audio
    vst-plugins
  )
  depends=(
    alsa-lib libasound.so
    freetype2 libfreetype.so
    gcc-libs
    glibc
    helm-synth-common=$pkgver
    libglvnd
    libx11
    libxext
    libxinerama
    vst-host
  )
  provides=($_pkgname-vst)
  conflicts=($_pkgname-vst)

  mv -v $_pkgname-vst-git/* "$pkgdir"
}
