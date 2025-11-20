# Maintainer: Zach Callear <zach@callear.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Chris <alostengineer at narmos dot org>
pkgname=pam_ssh_agent_auth
pkgver=0.10.4
pkgrel=5
pkgdesc="PAM module which permits authentication via the keyring in a forwarded ssh-agent."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jbeverly/pam_ssh_agent_auth"
license=('custom:OpenSSL')
_gentoo_patches_url_prefix=https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-auth/pam_ssh_agent_auth/files/pam_ssh_agent_auth-0.10.4-
_gentoo_patches_url_suffix='?id=13974ec7fb699e6e3b3199348e3c0393c45e5f41'
_gentoo_patch_1=0001-Fix-function-prototypes-in-configure.patch
_gentoo_patch_2=0002-Add-missing-includes-implicit-function-declarations.patch
_gentoo_patch_3=0003-Fix-incompatible-pointer.patch
_gentoo_patch_4=0004-Always-call-linker.patch
source=(
  "git+https://github.com/jbeverly/pam_ssh_agent_auth.git#tag=$pkgname-$pkgver"
  "$_gentoo_patch_1::$_gentoo_patches_url_prefix$_gentoo_patch_1$_gentoo_patches_url_suffix"
  "$_gentoo_patch_2::$_gentoo_patches_url_prefix$_gentoo_patch_2$_gentoo_patches_url_suffix"
  "$_gentoo_patch_3::$_gentoo_patches_url_prefix$_gentoo_patch_3$_gentoo_patches_url_suffix"
  "$_gentoo_patch_4::$_gentoo_patches_url_prefix$_gentoo_patch_4$_gentoo_patches_url_suffix"
)
sha256sums=('fd1a1dc2b82a15f2546a263215a74f74bd367353bf5ac9e51d1e873037bd8957'
  '5ff56f6ea23b8a1273828e74c0eadea3b01ae23dcca8d6e01827399d84888c47'
  '66dc5be89d21baad015f22f6197db3eb2b9d61efc416cccead4075424e4a1352'
  'dae2ee19bfd2425b04b9c982653e1433610fdb92ead1c1f495772b6ecbf66292'
  '2f63a192e0c2777d80fec3fcbe615c24fec3f66697ae22e0b76931547531d838')
makedepends=('git')
depends=('openssl')
optdepends=('openssh: standard ssh-agent'
  'gnupg: gpg ssh-agent')

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "../$_gentoo_patch_1"
  patch -Np1 -i "../$_gentoo_patch_2"
  patch -Np1 -i "../$_gentoo_patch_3"
  patch -Np1 -i "../$_gentoo_patch_4"
  autoconf

  cd ed25519-donna
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --with-mantype=man --libexecdir=/usr/lib/security --without-openssl-header-check
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.OpenSSL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
