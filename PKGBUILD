# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=sudachi
pkgver=1.0.13
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://sudachi.emuplace.app
license=(GPL-3.0-or-later)
provides=('sudachi')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'sdl2' 'ffmpeg' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb')
makedepends=('git' 'cmake' 'doxygen' 'mbedtls' 'ninja' 'zip' 'unzip' 'nasm' 'spirv-headers' 'vulkan-headers' 'vulkan-utility-libraries')
conflicts=('sudachi')
options=(!debug)
source=(https://github.com/emuplace/sudachi.emuplace.app/releases/download/v1.0.13/latest.zip)
b2sums=(98892cb734258dfb841656bdda6b0339d83ff1f448c9c6a05e01c2db31d7e4301708f69dcb5f24be7470eae78cb46e3a4b26470cc9f7da594ccaf4ca24000721)

prepare() {
  git config --file .gitmodules submodule.externals/SDL.branch release-2.30.x
  git config --file .gitmodules --remove-section submodule.externals/vulkan-headers
  git config --file .gitmodules --remove-section submodule.externals/Vulkan-Utility-Libraries
  git config --file .gitmodules --remove-section submodule.externals/discord-rpc
  update_submodules "$srcdir"
}

build() {
  cd "$srcdir"
  cmake -B build -GNinja \
    -DSUDACHI_TESTS=OFF \
    -DENABLE_QT6=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DSUDACHI_USE_QT_MULTIMEDIA=ON \
    -DSUDACHI_USE_QT_WEB_ENGINE=ON \
    -DSUDACHI_DOWNLOAD_ANDROID_VVL=OFF \
    -DSUDACHI_USE_BUNDLED_FFMPEG=ON \
    -DSUDACHI_USE_BUNDLED_VCPKG=ON \
    -DSUDACHI_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DSUDACHI_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
    -DSUDACHI_ENABLE_LTO=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-march=x86-64-v2" \
    -DCMAKE_CXX_FLAGS="-march=x86-64-v2"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
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
