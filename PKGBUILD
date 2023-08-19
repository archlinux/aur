# Maintainer: knedl1k <knedl1k At tuta Dot io>

pkgname=coppeliasim-bin
_name=coppeliasim
pkgver=4.5.1.rev4
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Robotic Simulation software from Coppelia Robotics. Formally known as VReP."
arch=("x86_64")
url="http://www.coppeliarobotics.com/"
license=("GPL" "LGPL")
optdepends=('icu60: BlueZero api dependency')
conflicts=('coppeliasim')
options=(!strip)
provides=('vrep' 'coppeliasim')
source=("${_name}-${pkgver}.tar.xz::https://www.coppeliarobotics.com/files/CoppeliaSim_Edu_V${_pkgver}_Ubuntu22_04.tar.xz")
noextract=("${source[0]%%::*}")
sha256sums=('a1da77a587d4d834e246086823098b349797d66d634994170bde67d682daa20f')

package() {
    install -d "${pkgdir}/usr/"{bin,share/doc}
    install -d "${pkgdir}/opt/${_name}" "${pkgdir}/usr/share/doc/${_name}"

    ln -s "/opt/${_name}/coppeliaSim.sh" "${pkgdir}/usr/bin/${_name}"

    # Extract everything but documentation into /opt, and docs into
    # /usr/share/doc, and ensure they're owned by root in the fakeroot env
    helpFiles="CoppeliaSim_Edu_V${_pkgver}_Ubuntu22_04/helpFiles"
    bsdtar -C "${pkgdir}/opt/${_name}/" --strip-components=1 \
        --exclude="${helpFiles}" --uid 0 --gid 0 \
        -xvJf "${srcdir}/${noextract[0]}"
    bsdtar -C "${pkgdir}/usr/share/doc/${_name}/" --strip-components=2 \
        --uid 0 --gid 0 \
        -xvJf "${srcdir}/${noextract[0]}" "${helpFiles}"

    cd "${pkgdir}/opt/${_name}"
    # Create an empty placeholder for this file so that pacman is aware of it.
    touch updtChck.dat

    # Executable application code should *not* be writeable by non-root,
    # but this is a silly application so I have no good way of "fixing" this.
    find ./ -type d -print0 | xargs -0 chmod go-w
    grep -ILZ '' * | xargs -0 chmod go-w
    grep -rIlZ '' */ | xargs -0 chmod -x
    find ./ -maxdepth 1 -type f -print0 | xargs -0 chmod go-w
    find ./ -iname "*.lua" -print0 | xargs -0 chmod 644
    find ./ -mindepth 2 -type f -print0 | xargs -0 chmod -x

    cd "${pkgdir}/usr/share/doc/${_name}"
    # Remove broken symlinks (they symlink to files under /home/marc...)
    rm en/simROS2.htm index/simROS2.json

    # Documentation shouldn't be executable at all or writable by non-root.
    find ./ -print0 | xargs -0 chmod go-w
    find ./ -type f -print0 | xargs -0 chmod -x
}
