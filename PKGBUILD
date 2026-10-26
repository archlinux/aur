# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# NNAL (Ascend Transformer Boost + ASDSIP). Closed source, hence -bin.
pkgname=asc-nnal-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='Huawei Ascend CANN NNAL: ATB (Ascend Transformer Boost) and ASDSIP'
arch=('x86_64' 'aarch64')
url='https://www.hiascend.com/developer/download/community/result?module=cann'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash' 'asc-toolkit' 'asc-runtime')
provides=('asc-nnal')
conflicts=('asc-nnal')
options=('!strip' '!debug' 'staticlibs')
makedepends=('unzip')

_zip="cann-nnal-${pkgver}.zip"
source_x86_64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-nnal_${pkgver}_linux-x86_64.zip")
source_aarch64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-nnal_${pkgver}_linux-aarch64.zip")
sha256sums_x86_64=('1ad4ce62596551723fab814b94b0c7e4606c6a1db3e48536939c539271216005')
sha256sums_aarch64=('71e279743f75da0523f9b9b8e352bf40870c3c314100dc1bfeda545fd4e51ac4')
noextract=("${_zip}")

prepare() {
  cd "$srcdir"
  [[ -f .prepared ]] && return
  rm -rf outer inner tk payloads
  mkdir -p outer inner payloads
  unzip -q "$_zip" -d outer
  unzip -q "outer/Ascend-cann-nnal_${pkgver}_linux-${CARCH}.zip" -d inner
  rm -rf tk
  bash "inner/Ascend-cann-nnal_${pkgver}_linux-${CARCH}.run" --noexec --extract="$srcdir/tk"
  local u n
  for u in tk/run_package/*.run; do
    n=$(basename "$u" .run)
    bash "$u" --noexec --extract="$srcdir/payloads/$n"
  done
  touch .prepared
}

package() {
  local b="$pkgdir/opt/ascend"

  # ATB -> /opt/ascend/atb/{9.2.0,latest}
  local atb=$(echo "$srcdir"/payloads/Ascend-cann-atb_*)
  install -d "$b/atb/$pkgver"
  cp -a "$atb/." "$b/atb/$pkgver/"
  rm -f "$b/atb/$pkgver/set_env.sh" "$b/atb/$pkgver/install.sh"
  install -Dm755 "$atb/set_env.sh" "$b/atb/set_env.sh"
  ln -s "$pkgver" "$b/atb/latest"

  # ASDSIP -> /opt/ascend/asdsip/{9.2.0,latest}
  local sip=$(echo "$srcdir"/payloads/Ascend-cann-SIP_*)
  install -d "$b/asdsip/$pkgver"
  cp -a "$sip/." "$b/asdsip/$pkgver/"
  rm -f "$b/asdsip/$pkgver/set_env.sh" "$b/asdsip/$pkgver/install.sh"
  install -Dm755 "$sip/set_env.sh" "$b/asdsip/set_env.sh"
  ln -s "$pkgver" "$b/asdsip/latest"

  install -Dm644 "$srcdir/tk/script/eula_en.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/ascend-nnal.sh" <<'PROFILE'
# Huawei Ascend NNAL (ATB + ASDSIP)
[ -f /opt/ascend/atb/set_env.sh ] && . /opt/ascend/atb/set_env.sh
[ -f /opt/ascend/asdsip/set_env.sh ] && . /opt/ascend/asdsip/set_env.sh
PROFILE
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
