# Maintainer: Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=transgui-sdk
pkgver=1.3
pkgrel=1
pkgdesc='Tools for building the transgui AUR package'
arch=(x86_64)
license=('custom') # https://wiki.lazarus.freepascal.org/FPC_modified_LGPL
makedepends=(git fpc=3.2.2)
depends=(qt5pas)
options=(!makeflags libtool staticlibs !strip !debug)

# this is pretty much https://github.com/lighterowl/transgui-sdk/blob/main/sdk_build.sh
# but rewritten as a PKGBUILD so it can be used as a dependency for transgui packages

readonly fpc_commit='56baf314b5ebf4e5a44fe3e214914fa2e1b34adb'
readonly lazarus_commit='cadda6230398688d6106fe37fb0673a9a2bf0cf3'

source=(
  "https://gitlab.com/freepascal.org/fpc/source/-/archive/${fpc_commit}/source-${fpc_commit}.tar.bz2"
  "https://gitlab.com/dkk089/lazarus/-/archive/${lazarus_commit}/lazarus-${lazarus_commit}.tar.bz2"
)
sha256sums=(
  '1991fcdcdb8b19db78f351083bfb3ddc800808c2ed73de286ffb2b9909915bf9'
  '98540a41c3cfd68af574c5f46f53995706afec5493529c43aed90c5b78694c47'
)

readonly sdk_dir=/opt/transgui-sdk
readonly fpc_installdir="${sdk_dir}/fpc-3.2.4-rc1"
readonly fpc_basepath="${fpc_installdir}/lib/fpc/3.2.4"

prepare()
{
  mv "source-${fpc_commit}" fpc-src
  mv "lazarus-${lazarus_commit}" lazarus
}

package()
{
  pushd "${srcdir}/fpc-src"

  make all
  mkdir -p "${pkgdir}/${sdk_dir}"
  make "PREFIX=${pkgdir}/${fpc_installdir}" install

  local -r fpc_configdir="${pkgdir}/${fpc_basepath}/../etc"
  mkdir -p "$fpc_configdir"

  "${pkgdir}/${fpc_installdir}/bin/fpcmkcfg" -d "basepath=${pkgdir}/${fpc_basepath}" -o "${fpc_configdir}/fpc.cfg"

  popd
  mv "${srcdir}/fpc-src" "${pkgdir}/${sdk_dir}/source"

  pushd "${srcdir}/lazarus"

  PATH="${pkgdir}/${fpc_installdir}/bin:${pkgdir}/${fpc_basepath}:$PATH" make bigide LCL_PLATFORM=qt5

  cat - > lazarus.cfg <<EOF
--primary-config-path=${sdk_dir}/lazarus/config
EOF
  mkdir config
  cat - > config/environmentoptions.xml << EOF
<CONFIG>
  <EnvironmentOptions>
    <LazarusDirectory Value="${sdk_dir}/lazarus"/>
  </EnvironmentOptions>
</CONFIG>
EOF

  popd
  mv "${srcdir}/lazarus" "${pkgdir}/${sdk_dir}"

  "${pkgdir}/${fpc_installdir}/bin/fpcmkcfg" -s -d "basepath=${fpc_basepath}" -o "${fpc_configdir}/fpc.cfg"

  cat - > "${pkgdir}/${sdk_dir}/source.me" <<EOF
export PATH=${sdk_dir}/lazarus:${fpc_installdir}/bin:${fpc_basepath}:\$PATH
EOF
}
