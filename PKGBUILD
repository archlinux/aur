# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: éclairevoyant
# Contributor: tarball <bootctl at gmail dot com>

# NOTE: fetch keys to allow verification of sigs in sha256sums-unsigned-build.txt:
# gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
# TODO: enable incremental builds, add addarmor

pkgname=mullvad-browser
pkgver=15.0
_buildver=build2
pkgrel=1
pkgdesc='Privacy-focused web browser developed by Mullvad VPN and the Tor Project'
arch=(x86_64)
url=https://mullvad.net/browser
license=(MPL-2.0)

depends=(
    alsa-lib at-spi2-core bash cairo dbus ffmpeg fontconfig freetype2 gcc-libs
    gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme libpulse libx11 libxcb
    libxcomposite libxdamage libxext libxfixes libxrandr libxss libxt mime-types
    nspr nss pango ttf-font
)
makedepends=(
    git perl-capture-tiny perl-data-dump perl-data-uuid perl-datetime
    perl-digest-sha1 perl-file-copy-recursive perl-file-slurp perl-io-all
    perl-json perl-lwp-protocol-https perl-parallel-forkmanager perl-path-tiny
    perl-sort-versions perl-string-shellquote perl-sys-syscall
    perl-template-toolkit perl-xml-libxml perl-yaml perl-yaml-libyaml
    perl-yaml-tiny wget zstd
)
optdepends=(
    'hunspell-en_US: Spell checking, american english'
    'libnotify: Notification integration'
    'networkmanager: Location detection via available wifi networks'
    'speech-dispatcher: Text-to-speech'
    'xdg-desktop-portal: Screensharing with wayland'
)
source=(
    git+https://gitlab.torproject.org/tpo/applications/tor-browser-build.git
    https://cdn.mullvad.net/browser/$pkgver/sha256sums-unsigned-build.txt
    https://cdn.mullvad.net/browser/$pkgver/sha256sums-unsigned-build.txt.asc
    $pkgname.desktop
)
sha256sums=(
    SKIP
    074099938c67889ef409921a5a6b3a7cc037b80b203ce3dfe45d57ef22e8e1c7
    SKIP
    a7f82f8d89b00bc0ea368299e979b900c87710b86b89eafb7122a502e5b47eaf
)
validpgpkeys=(
    EF6E286DDA85EA2A4BA7DE684E2C6E8793298290 # Tor Browser Developers (signing key) <torbrowser@torproject.org>
)

_builder=tor-browser-build
_pkgname=mullvadbrowser
_pkgver=mb-$pkgver-$_buildver

prepare() {
    cd /usr/include
    sudo $(which h2ph) sys/syscall.h asm/unistd.h asm/unistd_64.h bits/syscall.h

    cd "$srcdir"/$_builder
    git checkout -f tags/$_pkgver
    make submodule-update

    gpg --no-default-keyring --no-auto-check-trustdb \
        --keyring /tmp/$_pkgver.gpg --import keyring/* || true
}

build() {
    cd "$srcdir"/$_builder
    make $_pkgname-release-linux-$arch
}

check() {
    cd "$srcdir"/$_builder/$_pkgname/release
    sha256sum --ignore-missing -c ../../../sha256sums-unsigned-build.txt
}

package() {
    install -d "$pkgdir"/usr/lib/$pkgname "$pkgdir"/usr/bin
    tar -C "$pkgdir"/usr/lib/$pkgname --strip-components=2 \
        -xf "$srcdir"/$_builder/_$pkgname/release/$pkgname-linux-$arch-$pkgver.tar.xz
    ln -srfv "$pkgdir"/usr/lib/$pkgname/start-$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/applications "$srcdir"/$pkgname.desktop

    # fix perms
    cd "$pkgdir"/usr/lib/$pkgname
    chmod -R a+r .
    find . -executable -execdir chmod a+x '{}' +

    # replicate mb official deb pkg quirks to "blend with the crowd".
    # is-packaged-app sets browser_home to HOME
    cd "$pkgdir"/usr/lib/$pkgname
    rm -r .config/ start-$pkgname.desktop
    install -Dm644 -T /dev/null is-packaged-app

    # for docs. doc/Licenses is also a deb quirk
    cd "$pkgdir"/usr/lib/$pkgname/MullvadBrowser/Docs
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname ChangeLog.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname/Licenses Licenses/*
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname Licenses/*

    # for icons
    cd "$pkgdir"/usr
    for i in 16 32 48 64 128 scalable
    do
        if test $i == "scalable"
        then
            dir=share/icons/hicolor/scalable/apps
            fr=lib/$pkgname/browser/chrome/icons/default/about-logo.svg
            to=$dir/$pkgname.svg
        else
            dir=share/icons/hicolor/${i}x${i}/apps
            fr=lib/$pkgname/browser/chrome/icons/default/default${i}.png
            to=$dir/$pkgname.png
        fi
        install -d $dir
        ln -srf $fr $to
    done
}
