# Maintainer: necklace <ns@nsz.no>

pkgname=iridium-rpm
pkgver=115.0
pkgrel=2
# Sometimes the upstream packagers decide to change the folder name, so we have this for easy updating:
_folder='iridium-browser'
# But we still want to call it iridium-browser ourselves
_name='iridium-browser'
pkgdesc='Iridium browser - rhel/centos build altered for arch'
arch=('x86_64')
url="https://iridiumbrowser.de/"
license=('BSD')
provides=('iridium')
conflicts=('iridium' 'chromium')
# Why so many dependencies you ask? Some of which are implicit? Why, because namcap is the all-knowing God
# that knows what is right for your package, so you better include them all or it will warn you! :)
depends=(
    'alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'hicolor-icon-theme' 
    'libcups' 'libdrm' 'libffi' 'libpipewire' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 
    'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'qt5-base'
)
options=('!emptydirs' '!strip')
makedepends=('patchelf')

# Don't forget $CARCH in the link! Very important (for namcap).
source=("https://downloads.iridiumbrowser.de/epel8/iridium-browser-2023.07.115.1-1.el8.$CARCH.rpm")

sha256sums=('1e1925184b20f39eaa42db1da24904edade4bedcb37fbec48b6c2e3c6c019895')

package() (
    depends=(db gcc-libs glibc)
    
    mkdir -p "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/etc/${_folder}r"
    
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/" 
    cp -r "${srcdir}/usr/lib64/." "${pkgdir}/usr/lib/" 
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/etc/${_folder}" "${pkgdir}/etc/"

    # 115.0-2: Namcap complains:
    # Referenced library 'libffi.so.6' is an uninstalled dependency
    # We'll just pretend libffi 6 is compatible with current version (8 as of writing)
    patchelf "${pkgdir}/usr/lib/${_folder}/${_name}" --replace-needed "libffi.so.6" "libffi.so"
    #patchelf "${pkgdir}/usr/lib/${_folder}/libGLESv2.so" --replace-needed "libffi.so.6" "libffi.so"

    # 115.0-2: Namcap complains about missing custom license, we'll kindly show it where it is
    # Sadly, poor namcap doesn't understand folder symlinks so we'll have to bloat the package by copying. Oh well
    cp -r "${pkgdir}/usr/share/licenses/${_folder}" "${pkgdir}/usr/share/licenses/${pkgname}"

    # 115.0-2: Namcap complains symlink pointing to lib64 which it doesn't understand is a symlink to lib
    cd "${pkgdir}/usr/bin"
    rm "${_name}" 
    ln -s "../../usr/lib/${_folder}/${_name}.sh" iridium-browser

    # 115.0-2: Namcap complains about unused shared libraries in multiple files.
    # I tried to patchelf the unused shared libraries out with patchelf as such:
    # patchelf "${pkgdir}/usr/lib/${_folder}/iridium-browser" --remove-needed "libpthread.so.0" --remove-needed  "libdl.so.2"
    # This did not work:
    # Inconsistency detected by ld.so: dl-version.c: 204: _dl_check_map_versions: Assertion `needed != NULL' failed!
    # So we will not fix those warnings. But we can remove libraries we don't actually need to copy:
    rm "${pkgdir}/usr/lib/${_folder}/libEGL.so"
    rm "${pkgdir}/usr/lib/${_folder}/libGLESv2.so"
    rm "${pkgdir}/usr/lib/${_folder}/libvk_swiftshader.so"
    rm "${pkgdir}/usr/lib/${_folder}/libvulkan.so.1"
    
)
