# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_gitrepo=coco
_name="rusty-${_gitrepo}"
pkgname="${_name}-git"
pkgver=r8.9c07c1f
pkgrel=1
pkgdesc="TRS-80 Color Computer emulator written in Rust"
arch=('x86_64')
url="https://github.com/gorsat/${_gitrepo}"
license=('MIT')
install="${_name}.install"
depends=('sh' 'libgcc' 'glibc' 'alsa-lib')
makedepends=('git' 'cargo')

source=(
  "${pkgname}::git+${url}.git#branch=main"
  'rusty-coco.template.sh'
)
sha256sums=('SKIP'
            '9c2607dc5ddd9280a693d9faf859c4c5993352e2c40983014c2af92ec2295eb1')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  local coco_root="/usr/share/${_name}"

  cp "${_gitrepo}.yaml" "${_gitrepo}-demo.yaml"
  sed -i "s/^  #/  /g; 7s/^/#/" "${_gitrepo}.yaml"
  sed -i "s|\"BASIC.ROM\"|\"${coco_root}/BASIC.ROM\"|g" "${_gitrepo}.yaml"
  sed -i "s|\"EXTBASIC.ROM\"|\"${coco_root}/EXTBASIC.ROM\"|g" "${_gitrepo}.yaml"

  sed -i "s|\"hello.asm\"|\"${coco_root}/hello.asm\"|g" "${_gitrepo}-demo.yaml"

  sed "s|%CONFFILE%|${coco_root}/${_gitrepo}.yaml|g" ../../"${_name}.template.sh" > "${_name}"
  sed "s|%CONFFILE%|${coco_root}/${_gitrepo}-demo.yaml|g" ../../"${_name}.template.sh" > "${_name}-demo"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # Without this, compilation produces an error in "minifb".
  export CFLAGS="-fvisibility=default"
  export RUSTFLAGS="-C linker=cc -C link-arg=-Wl,--allow-shlib-undefined"

  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}"

  local coco_root="${pkgdir}/usr/%ITEM%/${_name}"

  install -Dm755 "target/release/${_gitrepo}" "${coco_root//%ITEM%/lib}/${_gitrepo}"
  install -Dm644 hello.asm "${coco_root//%ITEM%/share}/hello.asm"
  install -Dm644 disable_wait_routine.asm "${coco_root//%ITEM%/lib}/disable_wait_routine.asm"
  install -Dm644 "${_gitrepo}.yaml" "${coco_root//%ITEM%/share}/${_gitrepo}.yaml"
  install -Dm644 "${_gitrepo}-demo.yaml" "${coco_root//%ITEM%/share}/${_gitrepo}-demo.yaml"

  install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm755 "${_name}-demo" "${pkgdir}/usr/bin/${_name}-demo"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

