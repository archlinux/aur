# Maintainer: Konstantin Rannev <konstantin.rannev@gmail.com>
# Contributor: Ash <xash at riseup d0t net>

pkgname=lsfg-vk-git
pkgver=r199.e67fcd3
pkgrel=2
pkgdesc="Lossless Scaling Frame Generation on Linux via DXVK/Vulkan"
arch=('x86_64')
url="https://github.com/PancakeTAS/lsfg-vk"
license=('MIT')
depends=(
	'vulkan-icd-loader'
	'bash'
	'gcc-libs'
	'libglvnd'
)
makedepends=(
	'clang'
	'llvm'
	'vulkan-headers'
	'cmake'
	'meson'
	'ninja'
	'git'
	'sed'
	'sdl3'
	'glslang'
	'spirv-headers'
	'libxrandr'
	'libxinerama'
	'libxi'
	'libxkbcommon'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	# Main repo
	'git+https://github.com/PancakeTAS/lsfg-vk'

	# Submodules of lsfg-vk
	'git+https://github.com/PancakeTAS/dxbc.git'
	'git+https://github.com/trailofbits/pe-parse'
	'git+https://github.com/ToruNiina/toml11'
	'git+https://github.com/raysan5/raylib'

	# Submodule of dxbc (referenced under a different name in upstream's CMakeLists.txt)
	'spirv::git+https://github.com/KhronosGroup/SPIRV-Headers'

	# Submodule of pe-parse (referenced under a different name in upstream's CMakeLists.txt)
	'corkami-poc-dataset::git+https://github.com/corkami/pocs'

	# Submodules of toml11
	'git+https://github.com/doctest/doctest.git'
	'git+https://github.com/nlohmann/json.git'
	'git+https://github.com/alex-shpak/hugo-book.git'
)
sha256sums=(
	'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
install=lsfg-vk.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# ————————————————————————————————————————————————————
# Submodule initialization helpers borrowed from the
# zelda64recomp-git AUR package
# https://aur.archlinux.org/packages/zelda64recomp-git
# ————————————————————————————————————————————————————
_msg_info() {
	echo "${BOLD}>> ${GREEN}$@${ALL_OFF}"
}

_msg_warn() {
	echo "${BOLD}>> ${YELLOW}$@${ALL_OFF}"
}

_walk_submodules() {
    absdir="$(pwd | sed "s|^${srcdir}/||")"
    _msg_info "Entering directory <${absdir}>"

    # Obtain the hash and directory of the submodules listed by git
    local submodules="$(git ls-tree -r HEAD | awk '$1 == "160000"' | cut -d' ' -f3-)"

    # Check if the array is zero-length
    if [ -z "$submodules" ]; then
      return
    fi

    local hash dir
	# Split the git output on spaces and read the results into the variables hash and dir
    while ifs=" " read -r hash dir; do
    	# Obtain the submodule's directory's name and the repository's url from .gitmodules
        local basedir="$(basename "$dir")"
        local submodule_url="$(git config -f .gitmodules "submodule.${dir}.url")"

        # Check whether the submodule was pulled in
        if [ ! -e "${srcdir}/${basedir}" ]; then
            _msg_warn "Local repository ${basedir} (${submodule_url}) is missing from this PKGBUILD's directory. ${dir} is ignored for init!"
            continue
        fi

        _msg_info "Initializing submodule ${dir}"

        # Check if this specific commit exists locally within the repo (needed for git submodule update)
        (
            cd "${srcdir}/${basedir}"
            if ! git branch -a --contains "$hash" > /dev/null; then
                _msg_warn "Commit ${hash} of repo ${basedir} didn't get pulled from remote (${submodule_url}). Fetching now..."
                git fetch "$submodule_url" "$hash"
            fi
        )

        # Initialize and update submodule
        git submodule init "${dir}"
        git config "submodule.${dir}.url" "${srcdir}/${basedir}"
        git -c protocol.file.allow=always submodule update "${dir}"

        # Go inside the submodule's directory and search for its submodules (recursive)
        ( cd "$dir"; _walk_submodules; )
    done <<< "$submodules" # Feed each submodule into the loop one at a time

    _msg_info "Leaving directory <${absdir}>"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"

	_msg_info "Setting up the submodules..."
	_walk_submodules
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# Unset certain default makepkg flags that strip out necessary symbols in the linker
	export LDFLAGS="${LDFLAGS//-Wl,-z,now/} -Wl,-z,lazy"
	export CFLAGS="${CFLAGS//-flto=auto/}"

	cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS"
    cmake --build build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm644 VkLayer_LS_frame_generation.json "$pkgdir/etc/vulkan/implicit_layer.d/VkLayer_LS_frame_generation.json"
	install -Dm644 build/liblsfg-vk.so "$pkgdir/usr/lib/liblsfg-vk.so"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
