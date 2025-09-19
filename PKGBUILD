# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.10.0
_pkgver="${pkgver%.*}"
pkgrel=2

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  # 'aarch64'
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
            'ad8c16721a10a55b759f0cd63243301565b948b1d48075e1fda89ccf264a2bdf'
            '372444a8a866235a5b79e17f076b3d4f9ce74e1273ea380b677918057f106d98')

declare -rAg _modules_name_map=(
  # zls
  [src/known-folders]=https://github.com/ziglibs/known-folders/archive/24845b0103e611c108d6bc334231c464e699742c.tar.gz
  # [src/tracy]=https://github.com/wolfpld/tracy/archive/f493d4aa8ba8141d9680473fad007d8a6348628e.tar.gz
)
declare -rg _ignore_modules=(
  "src/tracy"
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

        # Check if $target matches any ignored submodules
        for ignore in "${_ignore_modules[@]}"; do
          if [[ "$target" == *"$ignore"* ]]; then
            echo "Ignoring submodule: $target"
            continue 2
          fi
        done

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

check() {
  export PATH="/opt/zig${_pkgver}:$PATH"
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
