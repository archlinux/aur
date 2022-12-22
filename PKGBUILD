# Maintainer: Johannes Jöns <johannes@joens.email>
pkgbase=noto-fonts-git
pkgname=('noto-fonts-hinted-git' 'noto-fonts-unhinted-git'
         'noto-fonts-unhinted-variable-git' 'noto-fonts-unhinted-variable-slim-git'
         'noto-fonts-full-git' 'noto-fonts-full-variable-git' 'noto-fonts-full-variable-slim-git')
pkgver=r5.efa9c9f
pkgrel=1
pkgdesc="Noto fonts git version"
arch=(any)
url="https://github.com/notofonts/"
license=('OFL')
makedepends=('git' 'python' 'python-pip' 'python-cairocffi')
conflicts=(noto-fonts{,-extra,})
provides=(noto-fonts{,-extra,})
source=("git+https://github.com/jopejoe1-aur/noto-fonts" "activate"
        "66-noto-sans.conf" "66-noto-serif.conf" "66-noto-mono.conf"
        "46-noto-sans.conf" "46-noto-serif.conf" "46-noto-mono.conf")
sha256sums=('SKIP'
            '11a256a464d24c66d52c109868cbc5c0e40fe7f125dc7762b862e62af1764fd9'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884')

_blocklist=(Arimo test armenian Cousine hanifi-rohingya multani old-hungarian-ui Tinos)

pkgver() {
    cd "${srcdir}/noto-fonts"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"
    rm -rf "venv"
    cd "noto-fonts"
    git submodule update --init --recursive

    for font in "${_blocklist[@]}"; do
        rm -rf "$font"
    done

    for dir in */; do
        cd "$dir"
        rm -rf "subset-files"
        rm -rf "venv"
        mkdir "subset-files"
        cd "subset-files"
        ln -s "${srcdir}/noto-fonts/latin-greek-cyrillic"
        cd ../..
    done
}

build() {
    cd "$srcdir/noto-fonts"
    for dir in */; do
        cd "$dir"
        if [ -e "$srcdir/venv/bin/activate" ]; then
            input="$srcdir/noto-fonts/$dir/venv"
            activate=$(cat "$srcdir/activate")
            activate="${activate//§TO_BE_REPLACED/$input}"
            echo "$activate" > "$srcdir/venv/bin/activate"
        else
            python -m pip install --upgrade pip
            python -m pip install --upgrade virtualenv
            python -m virtualenv "$srcdir/venv"
            input="$srcdir/noto-fonts/$dir/venv"
            activate=$(cat "$srcdir/activate")
            activate="${activate//§TO_BE_REPLACED/$input}"
            echo "$activate" > "$srcdir/venv/bin/activate"
        fi
        source "$srcdir/venv/bin/activate"
        python -m pip install --upgrade -r requirements.txt
        python -m fontmake -o variable --print-preview -m "Master_dev.designspace"
        deactivate
        cd ..
    done
}

_package() {
  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}

package_noto-fonts-hinted-git() {
    _package
    pkgdesc+=' (hinted)'
    conflicts+=(noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/hinted/ttf/*
}

package_noto-fonts-unhinted-git() {
    _package
    pkgdesc+=' (unhinted)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/unhinted/ttf/*
}

package_noto-fonts-unhinted-variable-git() {
    _package
    pkgdesc+=' (unhinted variable)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/unhinted/variable-ttf/*
}

package_noto-fonts-unhinted-variable-slim-git() {
    _package
    pkgdesc+=' (unhinted variable slim)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/unhinted/slim-variable-ttf/*
}

package_noto-fonts-full-git() {
    _package
    pkgdesc+=' (full)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/full/ttf/*
}

package_noto-fonts-full-variable-git() {
    _package
    pkgdesc+=' (full variable)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/full/variable-ttf/*
}

package_noto-fonts-full-variable-slim-git() {
    _package
    pkgdesc+=' (full variable slim)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/full/slim-variable-ttf/*
}
