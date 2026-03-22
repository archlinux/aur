# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de>

_Name="touchHLE"
pkgname="${_Name,,}"
pkgver=0.2.3
pkgrel=1
pkgdesc="High-level emulator for iPhone OS apps"
arch=('aarch64' 'x86_64')
url="https://touchhle.org"
_url="https://github.com/${_Name}/${_Name}"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc' 'openal' 'sdl2' 'ttf-liberation')
makedepends=('boost' 'cargo' 'cmake' 'sndio') # 'git'
options=('!lto')
backup=("etc/${pkgname}/options.txt")
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        # "rust-sdl2-touchHLE-3.tar.gz::https://github.com/hikari-no-yume/rust-sdl2/archive/refs/tags/touchHLE-3.tar.gz"
        # "${pkgname}_cargo_no_git.patch"
        "${pkgname}_cargo_system_sdl2.patch")
b2sums=('b60428f59cd99aa7141f17e271e7a5a21e57c32e720e76d86c294eb8d0e294ad086e2e1861e65fa0b3c5996b49a6ffd1e22d7566edcb496111243e170308d1cb'
        'd4185d5d59803d188d0fde8991be812e1db34b5b48979a72a9e2a39575971f2970fd725481bcfeec2cedc7669753853e49ae276064c73e503e342a31d07a4233'
        '49e590ce7851d915a7301e5d63928d8890fb3c2c04efcf99b4ce9a8de4fe3a950268a480880cb8419a5811750516149da7e47cdd8b92b8126a2df57b0f256fc6'
        '132774b7298d085c56f2b254b705dcc6a3b717b7a6435ffa1d2bff554a4f2fd49c9a773d1f24d02fc6303f611daf8f97c53e4cad73546971b213b9f7a7558bd2'
        'fc829158bf3e15e4cd36a16a75ad25331a8644cb002841485832d8dbe29bc630f7aebea8a3b8658a40034ecb41349261305f0f48fec27580c19696b30245a577')

declare -rAg _modules_name_map=(
  # touchhle
  [vendor/stb]=https://github.com/nothings/stb/archive/9f1776a36d2a3d63c52f705c3a84b372cfed4340.tar.gz
  [vendor/dynarmic]=https://github.com/touchHLE/dynarmic/archive/76aa4dd665085fb6ac10d4cd58e25466366d0799.tar.gz
  # [vendor/openal-soft]=https://github.com/kcat/openal-soft/archive/23c8a35505fe6ab7a5c87754911a133b23ac75cf.tar.gz
  [vendor/dr_libs]=https://github.com/mackron/dr_libs/archive/dd762b861ecadf5ddd5fb03e9ca1db6707b54fbb.tar.gz
  # [vendor/SDL]=https://github.com/libsdl-org/SDL/archive/07d0f51fa292895443f563f0cbde4cb3802d87fa.tar.gz
  # [rust-sdl2-touchHLE-3/sdl2-sys/SDL]=https://github.com/libsdl-org/SDL/archive/cb107bef58759468d715d919009bd2987954dade.tar.gz
)
declare -rg _ignore_modules=(
  # touchhle
  "vendor/openal-soft"
  "vendor/SDL"

  "vendor/dynarmic/externals/zydis/dependencies/zycore"
  "vendor/dr_libs/tests/external/miniaudio"
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
  # find "rust-sdl2-touchHLE-3" -type f -exec \
  #   install -D "{}" ./"${_pkgsrc}/{}" \;

  cd "${_pkgsrc}"
  _fill_gitmodules_recursively

  # patch -Np1 -i "${srcdir}/${pkgname}_cargo_no_git.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_cargo_system_sdl2.patch"

  # use FHS paths
  sed -i -e "s|touchHLE_dylibs|/usr/share/touchhle/dylibs|" \
    -e "s|touchHLE_fonts|/usr/share/touchhle/fonts|" \
    -e "s|touchHLE_default_options.txt|/etc/touchhle/options.txt|" src/paths.rs

  # add AUR version hint
  sed -i "s/git rev. unknown/AUR-${pkgrel}/" src/version/build.rs

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  # cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CFLAGS+=" -Wno-error=incompatible-pointer-types"
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # disable static link to sdl2 and openal
  # cargo build --frozen --release --all-features
  cargo build --frozen --release --no-default-features
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${_Name}" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "OPTIONS_HELP.txt" "${pkgdir}/usr/share/doc/${pkgname}/OPTIONS_HELP.txt"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vDm644 "${_Name}_default_options.txt" "${pkgdir}/etc/${pkgname}/options.txt"

  install -vd "${pkgdir}/usr/share/${pkgname}/fonts"
  declare -rA _font_symlinks=(
    ["LiberationSans-Bold.ttf"]="/usr/share/fonts/liberation/LiberationSans-Bold.ttf"
    ["LiberationSans-Italic.ttf"]="/usr/share/fonts/liberation/LiberationSans-Italic.ttf"
    ["LiberationSans-Regular.ttf"]="/usr/share/fonts/liberation/LiberationSans-Regular.ttf"
    # ["NotoSansJP-Bold.otf"]=""
    # ["NotoSansJP-Regular.otf"]=""
  )
  for font in "${!_font_symlinks[@]}"; do
    ln -vsf "${_font_symlinks[$font]}" "${pkgdir}/usr/share/${pkgname}/fonts/${font}"
  done
  find "${_Name}_fonts" -type f \( -name '*Noto*' -o -name '*noto*' \) -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/fonts/{}" \;

  cp -arP "${_Name}_dylibs" "${pkgdir}/usr/share/${pkgname}/dylibs"
}
