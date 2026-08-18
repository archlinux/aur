# Maintainer: Noel Jacob <noeljacob91 at gmail dot com>
pkgname=sccache-shims
pkgver=1.1
pkgrel=1
pkgdesc="Create sccache shims for every detected C/C++/Rust/CUDA compiler"
arch=('any')
license=('MIT')
depends=('sccache')
provides=('sccache-shims')
options=('!strip' '!debug')

package() {
  local shim_dir="${pkgdir}/usr/lib/sccache-shims/bin"
  install -dm755 "$shim_dir"

  # Detect every compiler binary in /usr/bin, including cross-compiler
  # triplets of any ABI (gnu, musl, eabi, mingw, android, etc.)
  local compilers
  compilers=$(find /usr/bin -maxdepth 1 -printf '%f\n' \
    | grep -P '(^|gnu-|musl-|eabi-|mingw-|android-)(gcc|g\+\+|clang|clang\+\+|cc|c\+\+|nvcc|cl)(-[0-9.]+)?$')

  if [[ -z "$compilers" ]]; then
    error "sccache-shims: no compilers detected"
    return 1
  fi

  local compiler
  while IFS= read -r compiler; do
    [[ -z "$compiler" ]] && continue
    ln -sf /usr/bin/sccache "${shim_dir}/${compiler}"
    msg2 "sccache-shims: created shim for ${compiler}"
  done <<< "$compilers"

  install -dm755 "${pkgdir}/etc/profile.d"
  
  cat > "${pkgdir}/etc/profile.d/sccache-shims.sh" <<'EOF'
export PATH="/usr/lib/sccache-shims/bin:${PATH}"
EOF
}
