# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=muvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.3.0.108.g8221fbc
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=171956'
license=('GPL')
depends=('vapoursynth-plugin-havsfunc-git'
         'vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-median-git'
         'vapoursynth-plugin-histogram'
         )
optdepends=('python-numpy: For use muvsfunc_numpy'
            'python-tensorflow: For use super_resolution function with TensorFlow as backend (muvsfunc_numpy)'
            'mxnet: For use super_resolution function with MxNET as backend (muvsfunc_numpy)'
            'vapoursynth-plugin-vsmxnet-git: For use super_resolution function with MxNET as backend (SuperRes)'
            'vapoursynth-plugin-vcfreq: For use with GPS function (muvsfunc_misc)'

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
            "muvs.py"
            'Collections/LUM.py'
            'Collections/SuperRes.py'
            "Collections/${_plug}_misc.py"
            "Collections/${_plug}_numpy.py"
            "Collections/net_interp.py"
            'Collections/resize.py'
            )

  for i in "${_scripts[@]}"; do
    install -Dm644 "${i}" "${pkgdir}${_site_packages}/${i/Collections/}"
    python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${i/Collections/}"
    python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${i/Collections/}"
  done

  (cd Collections; for i in $(find examples -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done)

  install -Dm644 Collections/descale_verifyer.vpy "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/test/descale_verifyer.vpy"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
