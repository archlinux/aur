# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=g41fun
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r13.c395f09
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url="https://github.com/Vapoursynth-Plugins-Gitify/G41Fun"
license=('apache')
depends=('vapoursynth-plugin-havsfunc-git'
         'vapoursynth-plugin-muvsfunc-git'
         'vapoursynth-plugin-nnedi3_resample-git'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-rgsf-git'
         'vapoursynth-plugin-vcm-git'
         )
optdepends=('vapoursynth-plugin-mvtools_sf-git')
makedepends=('git'
             'dos2unix'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Vapoursynth-Plugins-Gitify/G41Fun.git"
        'https://github.com/Selur/VapoursynthScriptsInHybrid/commit/c3cbed52cfa5a7592e3da1e8db7bfc9f547a74fc.diff'
        'https://patch-diff.githubusercontent.com/raw/groucho86/G41Fun/pull/1.diff'
        )
sha256sums=('SKIP'
            'ae19d3567626b605f0926ee399ab809d5874b261ec1f25d7eed06bc6f4c0602e'
            '94d4725ba095288c530fa79729ce5ab9325188b7814fe55b3fea05c2a361d662'
            )

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  cp "${srcdir}/c3cbed52cfa5a7592e3da1e8db7bfc9f547a74fc.diff" "${srcdir}/c3cbed52cfa5a7592e3da1e8db7bfc9f547a74fc_mod.diff"
  cp "${srcdir}/1.diff" "${srcdir}/1_mod.diff"
  dos2unix "${srcdir}/c3cbed52cfa5a7592e3da1e8db7bfc9f547a74fc_mod.diff"
  dos2unix "${srcdir}/1_mod.diff"
  patch --binary -p1 -i "${srcdir}/c3cbed52cfa5a7592e3da1e8db7bfc9f547a74fc_mod.diff"
  patch --binary -p1 -i "${srcdir}/1_mod.diff"
}

package(){
  cd "${_plug}"
  install -Dm644 G41Fun.py "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
