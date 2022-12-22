# Maintainer: Johannes Jöns <johannes@joens.email>
pkgbase=noto-fonts-git
pkgname=('noto-fonts-hinted-git' 'noto-fonts-unhinted-git' 'noto-fonts-unhinted-variable-git' 'noto-fonts-unhinted-variable-slim-git' 'noto-fonts-full-git' 'noto-fonts-full-variable-git' 'noto-fonts-full-variable-slim-git')
pkgver=r5.efa9c9f
pkgrel=1
pkgdesc="Noto fonts git version"
arch=(any)
url="https://github.com/notofonts/"
license=('OFL')
depends=('noto-fonts-config-files')
makedepends=('git' 'python' 'python-pip' 'python-cairocffi')
conflicts=(noto-fonts{,-extra,} ttf-croscore)
provides=(noto-fonts-{,-extra,})
source=("git+https://github.com/jopejoe1-aur/noto-fonts" "activate")
md5sums=('SKIP' '3f4a8c4eeb43639a1d910a6d462ffd0d')

_blocklist=( Arimo test armenian Cousine hanifi-rohingya multani old-hungarian-ui Tinos )

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
        rm -rf $font
    done

    for dir in */
        do
            cd $dir
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
    for dir in */
        do
            cd $dir
            if [ -e $srcdir/venv/bin/activate ]; then
                input="$srcdir/noto-fonts/$dir/venv"
                activate=$(cat "$srcdir/activate")
                activate="${activate//§TO_BE_REPLACED/$input}"
                rm $srcdir/venv/bin/activate
                echo "$activate" >> $srcdir/venv/bin/activate
                ln -s "${srcdir}/venv"
                make build
            else
                make build
                mv venv ${srcdir}
                ln -s "${srcdir}/venv"
            fi
            cd ..
        done
}

package_noto-fonts-hinted-git() {
    pkgdesc+=' (hinted)'
    conflicts+=(noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/hinted/ttf/*
}

package_noto-fonts-unhinted-git() {
    pkgdesc+=' (unhinted)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/unhinted/ttf/*
}

package_noto-fonts-unhinted-variable-git() {
    pkgdesc+=' (unhinted variable)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/unhinted/variable-ttf/*
}

package_noto-fonts-unhinted-variable-slim-git() {
    pkgdesc+=' (unhinted variable slim)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-full-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/unhinted/slim-variable-ttf/*
}

package_noto-fonts-full-git() {
    pkgdesc+=' (full)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-variable-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/full/ttf/*
}

package_noto-fonts-full-variable-git() {
    pkgdesc+=' (full variable)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-slim-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/full/variable-ttf/*
}

package_noto-fonts-full-variable-slim-git() {
    pkgdesc+=' (full variable slim)'
    conflicts+=(noto-fonts-hinted-git noto-fonts-unhinted-git noto-fonts-unhinted-variable-git noto-fonts-unhinted-variable-slim-git noto-fonts-full-git noto-fonts-full-variable-git)

    install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
        ${srcdir}/noto-fonts/*/fonts/*/full/slim-variable-ttf/*
}
