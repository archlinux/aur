# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=citron
pkgver=0.4
pkgrel=2
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'sdl2' 'ffmpeg' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb')
makedepends=('git' 'cmake' 'boost' 'catch2' 'doxygen' 'mbedtls' 'ninja' 'nlohmann-json' 'python-pip' 'python-jsonschema' 'python-jinja' 'zip' 'unzip' 'spirv-headers')
conflicts=('citron')
options=(!debug)
source=(https://git.citron-emu.org/Citron/Citron/archive/v0.4-canary-refresh.tar.gz)
b2sums=(e034818ceda14938bf45aee743a7bec410641caa76965a1636931cf420de3f70c0bfbe42e826cd16d4703ac0b809a8800b55fb120e860e8e3ec3389e70783d8b)

prepare() {
  cd "$srcdir/$pkgname"
  git config --file .gitmodules submodule.SDL.branch release-2.30.x
  git config -f .gitmodules submodule.mbedtls.url https://github.com/Mbed-TLS/mbedtls.git
  git config -f .gitmodules submodule.mbedtls.branch mbedtls-2.28
  git config -f .gitmodules submodule.dynarmic.url https://git.suyu.dev/suyu/dynarmic.git
  git config -f .gitmodules submodule.dynarmic.branch stable
  update_submodules "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -GNinja \
    -DCITRON_USE_BUNDLED_VCPKG=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DCITRON_TESTS=OFF \
    -DCITRON_USE_LLVM_DEMANGLE=OFF \
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
    -DCITRON_ENABLE_LTO=ON \
    -DCITRON_DOWNLOAD_ANDROID_VVL=OFF \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="-march=native -mtune=native"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir/$pkgname"/build install
}

update_submodules() {
    local _base_dir="$1"

    # Check if the .gitmodules file exists
    if [ ! -f "$_base_dir/.gitmodules" ]; then
        return
    fi

    echo "Updating submodules in $_base_dir..."

    # Navigate to the directory
    cd "$_base_dir" || exit 1

    # Extract submodule information while handling line endings correctly
    grep -E '^\s*url\s*=' .gitmodules | awk '{print $3}' | tr -d '\r' > _urls.txt
    grep -E '^\s*path\s*=' .gitmodules | awk '{print $3}' | tr -d '\r' > _paths.txt

    # Associate each path with its branch (if specified)
    touch _branches.txt  # Ensure the file exists
    > _branches.txt  # Clear the file

    while read -r _path; do
        _branch=$(grep -A2 "path = $_path" .gitmodules | grep -E '^\s*branch\s*=' | awk '{print $3}' | tr -d '\r')
        echo "$_branch" >> _branches.txt
    done < _paths.txt

    # Check if _paths.txt contains submodules before proceeding
    if [ ! -s _paths.txt ]; then
        rm -f _urls.txt _paths.txt _branches.txt
        cd - > /dev/null
        return
    fi

    # Read and process each submodule
    paste _paths.txt _urls.txt _branches.txt | while IFS=$'\t' read -r _path _url _branch; do
        if [ -d "$_path/.git" ]; then
            echo "Updating submodule: $_path"
            cd "$_path" || continue

            # Check if the specified branch is defined
            if [ -n "$_branch" ]; then
                git fetch origin "$_branch"
                git checkout "$_branch" || git checkout -b "$_branch" origin/"$_branch"
                git pull origin "$_branch"
            else
                git pull origin "$(git rev-parse --abbrev-ref HEAD)"
            fi

            cd - > /dev/null
        else
            echo "Cloning $_url into $_path..."
            if [ -n "$_branch" ]; then
                git clone --branch "$_branch" --single-branch "$_url" "$_path" || git clone "$_url" "$_path"
                cd "$_path" || continue
                git checkout "$_branch" || echo "Warning: The branch $_branch does not exist in $_url, using the default branch."
                cd - > /dev/null
            else
                git clone "$_url" "$_path"
            fi
        fi
    done

    # Recursively update each submodule before cleaning up
    while read -r _submodule_path; do
        update_submodules "$_base_dir/$_submodule_path"
    done < _paths.txt

    # Cleanup temporary files
    rm -f _urls.txt _paths.txt _branches.txt

    # Return to the previous directory
    cd - > /dev/null
}
