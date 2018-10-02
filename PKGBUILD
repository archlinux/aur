# Maintainer: Joe Hillenbrand <joehillen@gmail.com>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guix-git
pkgver=v0.15.0.r2345.gd8d8844ec
pkgrel=1
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64')
depends=(
  'bzip2'
  'glibc'
  'gnutls'
  'graphviz'
  'guile>=2.0.9'
  'guile-gcrypt'
  'guile-git-lib'
  'guile-json'
  'guile-sqlite3'
  'libgcrypt'
  'patch'
  'sqlite>=3.6.19'
  'xz'
  'zlib')
makedepends=(
  'autoconf'
  'automake'
  'gettext'
  'git'
  'help2man'
  'm4'
  'make'
  'pkg-config')
optdepends=(
  'bash-completion'
  'fish: completions'
  'emacs: emacs interface'
  'guile-ssh: to offload builds to other machines')
url="https://www.gnu.org/software/guix/"
license=('GPL3')
source=(git://git.sv.gnu.org/guix.git)
sha256sums=('SKIP')
provides=('guix')
conflicts=('guix')
install=guix.install

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}

  _bash_compl="--with-bash-completion-dir=\"$(pkg-config --variable=completionsdir bash-completion)\"" || _bash_compl=""
  _fish_compl="--with-fish-completion-dir=\"$(pkg-config --variable=completionsdir fish)\"" || _fish_compl=""

  msg2 'Building...'
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/guix \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/guix \
    --localstatedir=/var \
    $_bash_compl \
    $_fish_compl \
    --disable-rpath \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  make DESTDIR="${pkgdir}" install

  # Remove unused upstart service files
  rm -r "${pkgdir}/usr/lib/upstart"

  # Rename systemd service files provided by upstream because they are not
  # usable without previous guix installation
  local system_unit_dir="${pkgdir}/usr/lib/systemd/system"
  local guix_daemon_default="${system_unit_dir}/guix-daemon.service"
  local guix_daemon_upstream="${system_unit_dir}/guix-daemon-latest.service"
  local guix_publish_default="${system_unit_dir}/guix-publish.service"
  local guix_publish_upstream="${system_unit_dir}/guix-publish-latest.service"
  mv "${guix_daemon_default}" "${guix_daemon_upstream}"
  mv "${guix_publish_default}" "${guix_publish_upstream}"

  # Generate default systemd service files from upstream ones by fixing paths
  local guix_profile_root="/var/guix/profiles/per-user/root/guix-profile"
  sed -e "s|^ExecStart=${guix_profile_root}/bin|ExecStart=/usr/bin|" \
      -e "s|^Description=\(.*\)|Description=\1 (default)|" \
      -e "/^Environment=/d" "${guix_daemon_upstream}" \
      > "${guix_daemon_default}"
  sed -e "s|^ExecStart=${guix_profile_root}/bin|ExecStart=/usr/bin|" \
      -e "s|^Description=\(.*\)|Description=\1 (default)|" \
      -e "/^Environment=/d" "${guix_publish_upstream}" \
      > "${guix_publish_default}"

  # Make sure the above sed commands really work
  ! cmp "${guix_daemon_default}" "${guix_daemon_upstream}"
  ! cmp "${guix_publish_default}" "${guix_publish_upstream}"

  # Edit the description of upstream systemd service files
  sed -i "s|^Description=\(.*\)|Description=\1 (upstream)|" \
      "${guix_daemon_upstream}" "${guix_publish_upstream}"

  # The default makepkg strip option cannot be used here because binaries
  # installed in /usr/share must not be stripped.
  # To keep user-defined 'strip' and 'debug' options useful, we still
  # depend on 'tidy_strip' function provided by makepkg to do the stripping
  # work. To make the function useful, we have to temporarily remove the
  # '!strip' option from 'options' array. However, assignments to 'options'
  # cause mksrcinfo to insert wrong lines to .SRCINFO, so they have to be
  # put in eval.
  eval 'options=()'
  cd "${pkgdir}/usr/bin"
  tidy_strip
  cd "${pkgdir}/usr/lib/guix"
  tidy_strip
  eval 'options=("!strip")'

  # Make sure bootstrap binaries are not modified
  cd "${pkgdir}/usr/share/guile/site/2.2/gnu/packages/bootstrap"
  cat << EOF | sha256sum -c
e3bf6ffe357eebcc28221ffdbb5b00b4ed1237cb101aba4b1b8119b08c732387  aarch64-linux/bash
444c2af9fefd11d4fc20ee9281fa2c46cbe3cfb3df89cc30bcd50d20cdb6d6c0  aarch64-linux/mkdir
05273f978a072269193e3a09371c23d6d149f6d807f8e413a4f79aa5a1bb6f25  aarch64-linux/tar
48e9baa8a6c2527a5b4ecb8f0ac87767e2b055979256acab2a3dbff4f6171637  aarch64-linux/xz
2ad82bb9ee6e77eaff284222e1d43a2829b5a1e2bcf158b08564a26da48e0045  armhf-linux/bash
a19e386b31ebc8a46b5f934c11bca86e28f8aa997272a5fcd052b52d5019f790  armhf-linux/mkdir
da56be0b332fac3880b151abe60c1eeb2649cd192379b18658b1d872f7aa53e8  armhf-linux/tar
6507d04d55210e3a8cdc2e5758d79a4b0da3cb53bb142f60a78788af7b915ab1  armhf-linux/xz
ed059a9ae964d538605c923c4e73128bd5ca912994709b3fe2d71d061751e8c5  i686-linux/bash
b369264bda7bbb98d1acf0bf53ebc9077e82f48b190f3956fa23cb73d6e99f92  i686-linux/mkdir
9f7e79e52aa369fc9ed69359e503d4f8179117842df8261fc0cae5629cc896cb  i686-linux/tar
d23173dfe66c41e1c8d8eef905d14d1f39aaa52c9d70621f366c275e9139b415  i686-linux/xz
213cfb8794ffdf4a71cb321a89987ee61704edcec5d1203912575f0a626a239c  mips64el-linux/bash
d436070fde044366d72d7e59d8d12b1ba72b32d7b0f13e409b61118bdc8254c8  mips64el-linux/mkdir
d27fcb52f9b4a42fafdae3164fffd200f52e04d142574dcf06212dbf7701cbb8  mips64el-linux/tar
107eac7523b0148d18f461d81bec9d0db6154d6c61e4caf3a4cdb43a9a6afb3c  mips64el-linux/xz
265d2f633a5ab35747fc4836b5e3ca32bf56ad44cc24f3bd358f1ff6cf0779a5  x86_64-linux/bash
50689abdf2d5374e17ea8c51801f04f7590ad604af33a12a940cc11d137a4a2f  x86_64-linux/mkdir
16440b4495a2ff9c6aa50c05a8c9066e1004a5990b75aa891f08cdf8753c8689  x86_64-linux/tar
930ad7e88ca0b2275dc459b24aea912fadd5b7c9e95be06788d4b61efc7ef470  x86_64-linux/xz
EOF
}
