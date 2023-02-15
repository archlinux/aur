# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=muvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.4.0.26.gba5e7c6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=171956'
license=('GPL')
depends=('vapoursynth-plugin-havsfunc'
         'vapoursynth-plugin-mvsfunc-git'
         'vapoursynth-plugin-nnedi3_resample-git'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-bilateral-git'
         'vapoursynth-plugin-cas-git'
         'vapoursynth-plugin-ctmf-git'
         'vapoursynth-plugin-descale-git'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-misc-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-removegrain-git'
         'vapoursynth-plugin-sangnom-git'
         'vapoursynth-plugin-tcanny-git'
         'vapoursynth-plugin-temporalmedian-git'
#          'vapoursynth-plugin-vsfilter-git'     # windows only
#          'vapoursynth-plugin-vsfiltermod-git'  # windows only
          )
optdepends=('python-matplotlib'
            'python-numpy'
            'vapoursynth-plugin-vsakarin-git'
#             'mxnet: For use super_resolution function with MxNET as backend (muvsfunc_numpy)'
#             'vapoursynth-plugin-vsmxnet-git: For use super_resolution function with MxNET as backend (SuperRes)'
            )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/muvsfunc.git")
sha256sums=('SKIP')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
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
