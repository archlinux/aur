# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Jason Axelson <jason.axelsonATgmail.com>
# Contributor: Sean Escriva <sean.escrivaATgmail.com>
# Contributor: William Ting <william.h.tingATgmail.com>

pkgname=autojump-git
pkgver=22.5.3.r6.gee21082
pkgrel=1
pkgdesc="A faster way to navigate your filesystem from the command line"
arch=(any)
url="http://github.com/wting/autojump"
license=('GPL3')
depends=('python>=3.8')
makedepends=('git')
conflicts=('autojump')
provides=('autojump')
source=('git+https://github.com/wting/autojump.git')
md5sums=('SKIP')

_gitname="autojump"

pkgver() {
    cd ${_gitname}
    git describe --long --tags | sed 's/^release\-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd ${_gitname}
    ./install.py --prefix 'usr/' --destdir "${pkgdir}" --zshshare 'usr/share/zsh/site-functions'

    cd "${pkgdir}"/usr/share/$_gitname
    for i in $_gitname.* ; do
        ln -s /usr/share/$_gitname/$i \
            "${pkgdir}"/etc/profile.d/$i
    done

    # FS#60929
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "${pkgdir}/${site_packages}"
    mv ${pkgdir}/usr/bin/*.py "${pkgdir}/${site_packages}"
    python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
    python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"

    # FS#49601
    install -d "${pkgdir}"/usr/share/fish/completions
    mv "${pkgdir}"/etc/profile.d/$_gitname.fish "${pkgdir}"/usr/share/fish/completions

    # https://github.com/joelthelion/autojump/pull/339
    sed -i "s!/usr/local/!/usr/!g" "${pkgdir}"/etc/profile.d/$_gitname.sh
    sed -i "s!/build/${pkgname}/pkg/${pkgname}/!/!g" "${pkgdir}"/etc/profile.d/$_gitname.sh

    # FS#43762
    sed -i '27,31d' "${pkgdir}"/etc/profile.d/$_gitname.sh
}


# vim:set ts=4 sw=4 et:
