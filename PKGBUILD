# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the initial patches!
# https://github.com/mymedia2/tdesktop

# Updated using:
# https://raw.githubusercontent.com/archlinux/svntogit-community/packages/telegram-desktop/trunk/PKGBUILD
# Thanks to the Arch maintainers :)

# You can pass parameters to `ninja` via MAKEFLAGS

pkgname=telegram-desktop-dev
pkgver=4.15.4
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=(x86_64)
url="https://desktop.telegram.org/"
license=('GPL3')
# Although not in order, keeping them in the same order of the standard package
# for my mental sanity.
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'glibmm-2.68')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
# Specify the commit to fetch. Normally the version tag.
_commit="tag=v$pkgver"
# All the sources are Git repositories and might be adjusted when a build issue arise.
# These files might require modifications to be up-to-date.
# In such situation, extra patches will be added.
# An easy way to clone the repo since the last update is:
# git clone --recurse-submodules --shallow-submodules --shallow-since=vOLDVER --branch=vNEWVER https://github.com/telegramdesktop/tdesktop WORKDIR
source=(
    # Old approach, with many Git repos
    #"tdesktop::git+https://github.com/telegramdesktop/tdesktop#$_commit"
    # Here are all the submodule repos.
    # Use the nearby Python script for generating the list
    # ...
    # New approach: source tarball, same as the stable Arch package
    "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
)
sha512sums=('968445c11bc34f2de824c551249e3bc17659de5b20443e57ce0d2f4f9cedf36a89cb070bc3c62b6bee5e1eb25d9d2ec8c6ab14b14b47c4ce8f8daa0a1720ba66')

prepare() {
    # Magic submodule configuration, thanks to the Python script
    # ...

    # Normal preparation here
    cd "$srcdir/tdesktop-$pkgver-full"

    # Magic is over!
    # We need the extra flag for this vulnerability:
    # https://github.blog/2022-10-18-git-security-vulnerabilities-announced/#cve-2022-39253
    # With the -c flag we enable the file cloning only for this command, as per guidelines:
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    #git -c protocol.file.allow=always submodule update --recursive

    # Cheating! Linking fixed patches to their usual place
    #for fixed in $srcdir/*_fixed*
    #do
    #    ln -s $fixed ${fixed/_fixed/}
    #done
    # Patch here, if needed!
    # patch -Np1 -i "$srcdir/my_beautiful.patch"

    # Official package patches
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    #cmake -B build -S tdesktop -G Ninja \
    cmake -B build -S "tdesktop-$pkgver-full" -G "Unix Makefiles" \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c

    cmake --build build -- $MAKEFLAGS
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
