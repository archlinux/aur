# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.9.0
_pkgver="${pkgver%.*}"
pkgrel=2

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  # 'aarch64'
  # 'armv7h'
  'i686'
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
_pkgsrc="${_basename}-${pkgver}"
source=("${_basename}-versioned.sh"
        "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            '4c8993ee8bc652cd015a95e8e5e5b35a7670baa7033bf01d7f0620328ac671aa'
            '76817bd8e7261a60a0871a5ad350c79cb8d95543b66d810a2d16273e48045b74'
            '88fd69cb071693cec2a0ff22b71489c49ff056f53fd43e321ffe314b44975cce')

declare -rAg _modules_name_map=(
  # zls
  [src/known-folders]=https://github.com/ziglibs/known-folders/archive/9db1b99219c767d5e24994b1525273fe4031e464.tar.gz
  [src/zinput]=https://github.com/ziglibs/zinput/archive/5e0d781eee025cfea271dd10c1939d201fe4fd25.tar.gz
)

_get_source_name_string() {
  local host filename name commit
  host=$(echo "$1" | cut -d / -f 3)
  name=$(echo "$1" | cut -d / -f 5)
  filename=${1##*/}
  commit=${filename%%.*}
  case "$host" in
    gitlab.com)
      # It contains $name in $commit
      echo "$commit"
      ;;
    *)
      echo "$name-$commit"
      ;;
  esac
}

_fill_gitmodules_recursively() {
  local gitmodule
  find "${1:-.}" -type f -name .gitmodules | while read -r gitmodule
  do
    if [[ "$gitmodule" =~ ^\.\/ ]]
    then
      gitmodule=${gitmodule#*\.\/}
    fi
    local prefix
    prefix=$(dirname "$gitmodule")"/"
    if [[ "$prefix" =~ ^\.\/ ]]
    then
      prefix=${prefix#*\.\/}
    fi
    echo "Parsing $gitmodule to fill submodules..."
    local p
    grep path "$gitmodule" | awk '{print $3}' | while read -r p
    do
      p=${p%$'\r'} # Remove control characters
      if [[ -n "$p" ]]
      then
        local target url name commit fname
        target="$prefix$p"
        url="${_modules_name_map[$target]}"
        fname=$(_get_source_name_string "$url")
        echo "Filling $target with $srcdir/$fname..."
        cp -r "$srcdir/$fname/." "$target"
        _fill_gitmodules_recursively "$target"
      fi
    done
  done
}

declare _source_str _uri
for _uri in "${_modules_name_map[@]}"; do
  _source_str="$(_get_source_name_string "$_uri").tar.gz::$_uri"
  if [[ "${source[*]/$_source_str/}" == "${source[*]}" ]]
  then
    source+=("$_source_str")
  fi
done
unset _source_str _uri

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  cd "${_pkgsrc}"
  _fill_gitmodules_recursively
}

build() {
  local zig_options=(
    # --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    # -Doptimize=ReleaseSafe
    -Drelease-safe=true
    # -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_pkgver}" build "${zig_options[@]}"
}

# check() {
#   export PATH="/opt/zig${_pkgver}:$PATH"
#   local zig_options=(
#     # --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.41
#     -Dcpu=baseline
#     # -Doptimize=ReleaseSafe
#     -Drelease-safe=true
#     # -Dversion-string="${pkgver}"
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "zig${_pkgver}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
