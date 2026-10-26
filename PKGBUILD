# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# AMCT (Ascend Model Compression Toolkit). Closed source, hence -bin.
pkgname=asc-amct-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='Huawei Ascend Model Compression Toolkit: amct_acl plus Caffe/ONNX/PyTorch/TensorFlow plugins'
arch=('x86_64' 'aarch64')
url='https://www.hiascend.com/developer/download/community/result?module=cann'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash' 'python' 'asc-toolkit' 'asc-runtime')
provides=('asc-amct')
conflicts=('asc-amct')
options=('!strip' '!debug' 'staticlibs')
makedepends=('unzip')

_zip="cann-amct-${pkgver}.zip"
source_x86_64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-amct_${pkgver}_linux-x86_64.zip")
source_aarch64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-amct_${pkgver}_linux-aarch64.zip")
sha256sums_x86_64=('c1356f297f7302da168bfd59d4901f8548da67e438163da0a63d9eaa6f62a971')
sha256sums_aarch64=('29b2a706dabbcfaf61efebfb2e37a1f2bf14f76506d6e91da6a050a9d5cadf7c')
noextract=("${_zip}")
_libdir="${CARCH}-linux"

prepare() {
  cd "$srcdir"
  [[ -f .prepared ]] && return
  rm -rf outer dist acl
  mkdir -p outer dist
  unzip -q "$_zip" -d outer
  bsdtar -xf "outer/Ascend-cann-amct_${pkgver}_linux-${CARCH}.tar.gz" -C dist
  bash "dist/amct_acl/cann-amct_acl_${pkgver}_linux-${CARCH}.run" \
    --noexec --extract="$srcdir/acl"
  rm -f "dist/amct_acl/cann-amct_acl_${pkgver}_linux-${CARCH}.run"
  touch .prepared
}

package() {
  local root="$pkgdir/opt/ascend/cann-${pkgver}"
  local src="$srcdir/acl" e

  # amct_acl is a regular CANN component and installs into the CANN root
  install -d "$root/$_libdir"
  [[ -d $src/$_libdir ]] && cp -a "$src/$_libdir/." "$root/$_libdir/"
  for e in "$src"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      "$_libdir"|set_env.sh) continue ;;
    esac
    cp -a "$e" "$root/"
  done
  # identical copies shipped by every component; owned by asc-runtime-bin
  rm -f "$root/$_libdir/conf/path.cfg" \
        "$root/$_libdir/bin/setenv.bash"

  # framework plugins are pip/tar distributions the user installs per framework
  install -d "$pkgdir/opt/ascend/amct/$pkgver"
  cp -a "$srcdir/dist/." "$pkgdir/opt/ascend/amct/$pkgver/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'LIC'
This package repackages binaries distributed by Huawei Technologies Co., Ltd.
See the CANN Open Software License Agreement Version 2.0 installed by
asc-toolkit-bin at /usr/share/licenses/asc-toolkit-bin/LICENSE.
LIC

  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/ascend-amct.sh" <<'PROFILE'
# Huawei Ascend AMCT
case ":${PYTHONPATH:-}:" in
  *":/opt/ascend/amct/9.2.0:"*) ;;
  *) PYTHONPATH="/opt/ascend/amct/9.2.0${PYTHONPATH:+:$PYTHONPATH}" ;;
esac
export PYTHONPATH
PROFILE
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
