# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=muvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.3.0.37.gbb44453
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=171956'
license=('GPL')
depends=('vapoursynth-plugin-havsfunc-git'
         'vapoursynth-plugin-mvsfunc-git'
         )
optdepends=('python-numpy: For use muvsdunc_numpy'
            'python-tensorflow: For use super_resolution function with TensorFlow as backend (muvsdunc_numpy)'
            'mxnet: For use super_resolution function with MxNET as backend (muvsdunc_numpy)'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/muvsfunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"

  _scripts=("${_plug}.py"
            "Collections/${_plug}_numpy.py"
            "Collections/${_plug}_misc.py"
            "Collections/net_interp.py"
            'Collections/resize.py'
            'Collections/LUM.py'
            'Collections/SuperRes.py'
            )

  for i in "${_scripts[@]}"; do
    install -Dm644 "${i}" "${pkgdir}${_site_packages}/${i/Collections/}"
    python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${i/Collections/}"
    python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${i/Collections/}"
  done

  (cd Collections; for i in $(find examples -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done)

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
