# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.12.0
_pkgver="${pkgver%.*}"
pkgrel=2

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  'aarch64'
  # 'armv7h'
  'i686'
  # 'powerpc64le'
  # 'riscv64'
  'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=('MIT')
depends=(
  'sh'
  "zig${_pkgver}"
)
_zigdepends=(
  # zls
  "known-folders-bf79988adcfce166f848e4b11e718c1966365329.tar.gz::https://github.com/ziglibs/known-folders/archive/bf79988adcfce166f848e4b11e718c1966365329.tar.gz"
  "diffz-e10bf15962e45affb3fcd7d9a950977a69c901b3.tar.gz::https://github.com/ziglibs/diffz/archive/e10bf15962e45affb3fcd7d9a950977a69c901b3.tar.gz"
)
_pkgsrc="${_basename}-${pkgver}"
noextract=("${_zigdepends[@]%%::*}")
source=("${_basename}-versioned.sh"
        "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${_zigdepends[@]}")
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            'c8c59dc6a708f3857ffbc1f593db4f6409e50e5ff1319b84dc65b84271e5a3d8'
            'f93ef6c14192bf79fba608f3c37bc31e85c4c7370fb855e9afa930a17cd85ff2'
            'b7978837f68c73d46f3f3ec6d12420d9ee52999d9da09cfa833ed974a7ad20e0')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  for dep in "${_zigdepends[@]}"; do
    "zig${_pkgver}" fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    # -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_pkgver}" build "${zig_options[@]}"
}

check() {
  export PATH="/opt/zig${_pkgver}:$PATH"
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    # -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig${_pkgver}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
