# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="touchHLE"
pkgname="${_Name,,}"
pkgver=0.2.2
pkgrel=3
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
        # "rust-sdl2-touchHLE-2.tar.gz::https://github.com/hikari-no-yume/rust-sdl2/archive/refs/tags/touchHLE-2.tar.gz"
        # "${pkgname}_cargo_no_git.patch"
        "${pkgname}_cargo_system_sdl2.patch"
        "${pkgname}_fhs_paths.patch")
b2sums=('14e64acca91626e2f43f7e55b80083aa4ccdde290a9b8dfdb4fbaa1bc681c7a0c19a32cbd7aaea6e7427f64c48d7705f301bd0eb9a3aacbc32a6ef29849e053c'
        '721bd0a10829dcd1e97f7e7b85900703ead4def040601d93ebf1c658c2853f9470eb6e3b3b7d9fdedca5ece503877af2e9760bd7a0fb3ed9281092f16e64812d'
        '09f17ff91706fc1b4230ccd7cbbff17af2088cd2585f73802cd4e206ec1cb73252c252b29f1e873de4f866eff096529fb33525502675a2bbfaf5a96d86a10fb3'
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

  # rust-sdl2-touchHLE-2
  # [rust-sdl2-touchHLE-2/sdl2-sys/SDL]=https://github.com/libsdl-org/SDL/archive/cb107bef58759468d715d919009bd2987954dade.tar.gz
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
  # find "rust-sdl2-touchHLE-2" -type f -exec \
  #   install -D "{}" ./"${_pkgsrc}/{}" \;

  cd "${_pkgsrc}"
  _fill_gitmodules_recursively

  # patch -Np1 -i "${srcdir}/${pkgname}_cargo_no_git.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_cargo_system_sdl2.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_fhs_paths.patch"

  sed -i "s|std::fs::write(out_dir.join(\"version.txt\"), version).unwrap();|std::fs::write(out_dir.join(\"version.txt\"), \"${pkgver}+AUR-${pkgrel}\").unwrap();|" 'build.rs'

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
