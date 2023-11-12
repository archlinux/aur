# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Posi <posi1981@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

# anki -> git rev-parse $pkgver --short=8
# ftl -> git submodule
declare -gA _tags=(
 [ftl_core]="45c91b32dee9f52ae051fe5e1f3d574fa3b62d67"
 [ftl_desktop]="c0e842b10586d2a72357db1aa9e366ea695ac266"
 [anki]="fac9e0e"
)
declare -gA _caches=(
    [yarn]="yarn-cache"
    [cargo]="cargo-cache"
)

pkgname=anki-qt5
pkgver=23.10.1
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) - Qt5 Build"
url="https://apps.ankiweb.net/"
license=('AGPL3')
arch=('x86_64')
provides=('anki')
conflicts=('anki' 'anki-bin' 'anki-git')
depends=(
    # anki & aqt
    'python>=3.9'
    'python-beautifulsoup4'
    'python-waitress>=2.0.0'
    'python-requests'
    'python-pyqt5-webengine'

    # anki
    'python-decorator'
    'python-markdown'
    'python-orjson'
    'python-protobuf>=4.21'
    'python-pysocks'
    'python-distro'

    #aqt
    'python-flask-cors' # python-flask required for anki & aqt but a dependency of -cors
    'python-jsonschema'
    'python-send2trash'
    'python-certifi'
    'python-pyqt5>=5.14'
    'qt5-svg'
)

makedepends=(
    'rsync'
    'git'
    'ninja'
    'cargo'
    'python-installer' # TODO: could use either wheel or installer, both are not needed afaik
    'python-wheel'
    'nodejs>=18'
    'yarn'
    'mold'
)
optdepends=(
    'lame: record sound'
    'mpv: play sound. prefered over mplayer'
    'mplayer: play sound'
    'texlive-most: render LaTex in cards'
)
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ankitects/anki/archive/refs/tags/${pkgver}.tar.gz"
        "anki-core-i18n-${_tags[ftl_core]}.tar.gz::https://github.com/ankitects/anki-core-i18n/archive/${_tags[ftl_core]}.tar.gz"
        "anki-desktop-ftl-${_tags[ftl_desktop]}.tar.gz::https://github.com/ankitects/anki-desktop-ftl/archive/${_tags[ftl_desktop]}.tar.gz"
        "disable-git-checks.patch"
        "no-update.patch"
        "strip-formatter-deps.patch"
        "strip-type-checking-deps.patch"
        "force_qt5.patch"
)
sha256sums=('561fc902f3ad35e51686938e706d5a267bbc9a905ca0e9cc5be59b1617f3a551'
            '9fab0284a3110ec91cf5f346b18e9b9513ac566f25f262a61295dc538dc5ac6e'
            '576d1a75236cb6817bc98410753c87a637efa29dc0d52cc2ab585c7ae531f35a'
            '94d8b6d6541ce0c00ab1ddc88d2f384a6535e9849891f30a02bb07bd60178086'
            'cc546f4e5af642af89f82be0375800c2721dd904c0a212cf46f6459495b75bff'
            '9858fefa254812980d252b29fc6f32bd19bb83ee7e5a96d72c707626ed5193a7'
            '198bc2ec14439e3ba41a03c4823f07df4b0c559c1dcbdaf678416ed12a720c2e'
            '02767ace172813cb2e8196838905dbc5fc7e26f853e988b9ff0bfc5276645a31'
)

prepare() {
    cd "anki-$pkgver"

    patch -p1 < "$srcdir/force_qt5.patch"
    patch -p1 < "$srcdir/no-update.patch"
    patch -p1 < "$srcdir/strip-formatter-deps.patch"
    patch -p1 < "$srcdir/strip-type-checking-deps.patch"
    patch -p1 < "$srcdir/disable-git-checks.patch"
    sed -i 's/opt-level = 1$/opt-level= 3/' Cargo.toml	# optimize more
    sed -i 's/channel = "[0-9\.]*"$/channel = "stable"/' rust-toolchain.toml # use most recent stable rust toolchain
    # Build process wants .git/HEAD to be present. Workaround to be able to use tarballs
    # (together with disable-git-checks.patch)
    mkdir -p .git
    touch .git/HEAD
    sed -i "s/MY_REV/${_tags[anki]}/" build/runner/src/build.rs

    # place translations in build dir
    rm -r ftl/core-repo ftl/qt-repo
    ln -sT "${srcdir}"/anki-core-i18n-${_tags[ftl_core]} ftl/core-repo
    ln -sT "${srcdir}"/anki-desktop-ftl-${_tags[ftl_desktop]} ftl/qt-repo

    #force update for 'rustup' package users (not necesarry for 'rust' package users)
    pacman -Qo $(which cargo) | grep -q rustup && rustup update
    # fetch rust packages
    export CARGO_HOME="$srcdir/${_caches[cargo]}"       # do not litter in ~
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    # fetch node packages already in prepare()
    export YARN_CACHE_FOLDER="$srcdir/${_caches[yarn]}" # do not litter in ~
    yarn install --immutable --modules-folder out/node_modules
    ln -sf out/node_modules ./

    # mask pip-sync as we provide dependencies ourselves
    local venv="out/pyenv"
    python -m venv --system-site-packages --without-pip "$venv"
    printf '#!/bin/bash\nexit 0' > "$venv/bin/pip-sync"
    chmod +x "$venv/bin/pip-sync"
}
build() {
    cd "anki-$pkgver"
    export YARN_CACHE_FOLDER="$srcdir/${_caches[yarn]}" # do not litter in ~

    #use local binaries instead of downloading them
    export PYTHON_BINARY=$(which python)
    export PROTOC_BINARY=$(which protoc)
    export NODE_BINARY=$(which node)
    export YARN_BINARY=$(which yarn)

    export CARGO_HOME="$srcdir/${_caches[cargo]}"    # do not litter in ~
    export RELEASE=2	        # anki-internal variable for optimization
    mold -run ./ninja wheels -v # use mold as linker to allow for LTO
}

package() {
    cd "anki-$pkgver"
    for file in out/wheels/*.whl; do
    	python -m installer --destdir="$pkgdir" $file
    done

    install -Dm644 qt/bundle/lin/anki.desktop "$pkgdir"/usr/share/applications/anki.desktop
    install -Dm644 qt/bundle/lin/anki.png "$pkgdir"/usr/share/pixmaps/anki.png
}
