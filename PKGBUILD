# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the initial patches!
# https://github.com/mymedia2/tdesktop

# Updated using:
# https://raw.githubusercontent.com/archlinux/svntogit-community/packages/telegram-desktop/trunk/PKGBUILD
# Thanks to the Arch maintainers :)

# You can pass parameters to nake / ninja via MAKEFLAGS.
# You can use TMPDIR in $srcdir by exporting TMPDIR_FIX with some value.

pkgname=telegram-desktop-dev
pkgver=5.7.2
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=(x86_64)
url="https://desktop.telegram.org/"
license=('GPL3')
# Although not in order, keeping them in the same order of the standard package
# for my mental sanity.
# libtg_owt-git for now until the official repo is updated.
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'kcoreaddons' 'openh264')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'python-packaging'
             'glib2-devel')
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
    "$pkgname-28611.patch::https://patch-diff.githubusercontent.com/raw/telegramdesktop/tdesktop/pull/28611.patch"
)
sha512sums=('55fa4f20ceae71f2b869c00abdcf6a27f505156f7b254e38a68a97ea34b09e2e9deeef1fec6c5633e93043fb2e9e9ea72502ec9daeed319c8de65cbe825ca916'
            'b959fd3d26734e4361f8f567eacc874cd753b347b55fa0fc2640d10b65f1a6788b677967c601b1f92f636831c8aafe7681145ab35c69c983960ec3b78707f321')

prepare() {
    # Magic submodule configuration, thanks to the Python script
    # ...

    # Normal preparation here
    cd "$srcdir/tdesktop-$pkgver-full"

    patch -Np1 -i "$srcdir"/$pkgname-28611.patch

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

    # Ensure that we won't have issues with tmpfs.
    # Available via TMPDIR_FIX
    if [ -n "$TMPDIR_FIX" ]
    then
        export TMPDIR="$srcdir/build_tmp"
        mkdir -p $TMPDIR
        echo "Using \$TMPDIR = $TMPDIR ..."
    fi

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
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
