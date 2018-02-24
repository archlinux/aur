pkgbase=usefuld
_pkgbase=systemd
pkgname=('usefuld' 'libusefuld')
# latest commit on stable branch
_commit='7909254c7a8ee09d91b8b21fd779320b3e2fe716'
# Bump this to latest major release for signed tag verification,
# the commit count is handled by pkgver() function.
pkgver=237.64
pkgrel=1
arch=('x86_64')
url="https://www.github.com/systemd/systemd"
makedepends=('docbook-xsl' 'gperf'
             'intltool' 'iptables' 'kmod' 'libcap'
             'util-linux' 'linux-api-headers'
             'shadow' 'gnu-efi-libs' 'git'
             'meson')
options=('strip')
validpgpkeys=('63CDA1E5D3FC22B998D20DD6327F26951A015CC4')  # Lennart Poettering <lennart@poettering.net>
source=('git://github.com/systemd/systemd-stable.git'
        'git://github.com/systemd/systemd.git' # pull in for tags, backports & reverts
        'arch.conf'
        'loader.conf'
        'https://git.archlinux.org/svntogit/packages.git/plain/systemd/repos/core-x86_64/splash-arch.bmp'
        'systemd-sysusers.hook'
        'systemd-tmpfiles.hook')
sha512sums=('SKIP'
            'SKIP'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            '7d49a948f5d58f662a7d81544254528257ef8c0a08ca560834f09a7cdf566161d2df4d419ebbc2983196cd45c9eeefcd0c4c2c554376916dce42e895262afc30'
            'e521d92674597f82d589b83c378c50c92c881fdb84c436c8b26f7a3436a4c91a20585824a5563933f6868a3023b9ee2fdc7bd58e04bb47c25a0a36e296308fd3')

_backports=(
)

_reverts=(
)

_validate_tag() {
  local success fingerprint trusted status tag=v${pkgver%.*}

  parse_gpg_statusfile /dev/stdin < <(git verify-tag --raw "$tag" 2>&1)

  if (( ! success )); then
    error 'failed to validate tag %s\n' "$tag"
    return 1
  fi

  if ! in_array "$fingerprint" "${validpgpkeys[@]}" && (( ! trusted )); then
    error 'unknown or untrusted public key: %s\n' "$fingerprint"
    return 1
  fi

  case $status in
    'expired')
      warning 'the signature has expired'
      ;;
    'expiredkey')
      warning 'the key has expired'
      ;;
  esac

  return 0
}

pkgver() {
  local version count

  cd "$_pkgbase-stable"

  version="$(git describe --abbrev=0 --tags)"
  count="$(git rev-list --count ${version}..)"
  printf '%s.%s' "${version#v}" "${count}"
}

prepare() {
  cd "$_pkgbase-stable"

  git remote add upstream ../systemd/
  git fetch --all

  git checkout "${_commit}"

  _validate_tag || return

  local _commit
  for _commit in "${_backports[@]}"; do
    git cherry-pick -n "$_commit"
  done
  for _commit in "${_reverts[@]}"; do
    git revert -n "$_commit"
  done

  # patch nspawn to work without systemd
  sed -i 's#static bool arg_register = true;#static bool arg_register = false;#' src/nspawn/nspawn.c
  sed -i 's#static bool arg_keep_unit = false;#static bool arg_keep_unit = true;#' src/nspawn/nspawn.c
}

build() {
  local timeservers=({0..3}.arch.pool.ntp.org)

  local meson_options=(
    -Daudit=false
    -Dgnuefi=true
    -Dima=false
    -Dlz4=true

    -Ddbuspolicydir=
    -Ddefault-dnssec=no
    # TODO(dreisner): consider changing this to unified
    -Ddefault-hierarchy=hybrid
    -Ddefault-kill-user-processes=false
    -Dfallback-hostname='archlinux'
    -Dntp-servers="${timeservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=


    # disable everything
    -Dlogind=false
    -Dmachined=false
    -Dimportd=false
    -Dhostnamed=false
    -Dnetworkd=false
    -Dresolve=false
    -Dgshadow=false
    -Dtpm=false
    -Dtimedated=false
    -Dlocaled=false
    -Dcoredump=false
    -Dlibtool-lock=false
    -Dnls=false
    -Dlto=false
    -Ddbus=false
    -Dutmp=false
    -Dxkbcommon=false
    -Dseccomp=false
    -Dima=false
    -Dselinux=false
    -Dapparmor=false
    -Dadm-group=false
    -Dwheel-group=false
    -Dpam=false
    -Dxz=false
    -Dzlib=false
    -Dbzip2=false
    -Dlz4=false
    -Dacl=false
    -Dsmack=false
    -Dgcrypt=false
    -Daudit=false
    -Delfutils=false
    -Dlibcryptsetup=false
    -Dqrencode=false
    -Dgnutls=false
    -Dmicrohttpd=false
    -Dlibcurl=false
    -Didn=false
    -Dlibidn=false
    -Dlibidn2=false
    -Dpcre2=false
    -Dlibiptc=false
    -Dbinfmt=false
    -Dvconsole=false
    -Dquotacheck=false
    -Denvironment-d=false
    -Dfirstboot=false
    -Drandomseed=false
    -Dbacklight=false
    -Drfkill=false
    -Dtimesyncd=false
    -Dhibernate=false
    -Dldconfig=false
    -Dtests=unsafe
    -Dpolkit=false
    -Dhwdb=false
    # enable useful things
    -Dmyhostname=true
    -Dblkid=true
    -Dkmod=true
    -Dmanpages=true
  )

  arch-meson "$_pkgbase-stable" build "${meson_options[@]}"

  ninja -C build
}

package_usefuld() {
  pkgdesc="minimal systemd build for setups without systemd, exclude udev, include tmpfiles, sysvusers, nspawn, boot,..."
  license=('GPL2' 'LGPL2.1')
  groups=('base-devel')
  depends=('bash' 'iptables' 'kmod'
           'libusefuld'
           'util-linux')
  optdepends=('eudev: needs standalone udev')
  provides=('nss-myhostname' "systemd-tools=$pkgver" "systemd=$pkgver")
  replaces=('nss-myhostname' 'systemd-tools' 'systemd')
  conflicts=('nss-myhostname' 'systemd-tools' 'systemd')
  install="systemd.install"

  DESTDIR="$pkgdir" ninja -C build install

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -rf "$pkgdir/etc/systemd/system/"*.wants
  rm -rf "$pkgdir/etc/systemd/system/"*.service

  # add back tmpfiles.d/legacy.conf
  install -m644 "$_pkgbase-stable/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules
  sed -i 's/dialout/uucp/g;
          s/tape/storage/g;
          s/cdrom/optical/g' "$pkgdir"/usr/lib/sysusers.d/basic.conf

  # ensure proper permissions for /var/log/journal
  # The permissions are stored with named group by tar, so this works with
  # users and groups populated by systemd-sysusers. This is only to prevent a
  # warning from pacman as permissions are set by systemd-tmpfiles anyway.
  chown root:systemd-journal "$pkgdir/var/log/journal"
  chmod 2755 "$pkgdir/var/log/journal"

  # runtime libraries shipped with libsystemd
  rm "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so*

  # allow core/filesystem to pristine nsswitch.conf
  rm "$pkgdir/usr/share/factory/etc/nsswitch.conf"
  sed -i '/^C \/etc\/nsswitch\.conf/d' "$pkgdir/usr/lib/tmpfiles.d/etc.conf"

  # add example bootctl configuration
  install -Dm644 "$srcdir/arch.conf" "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -Dm644 "$srcdir/loader.conf" "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 "$srcdir/splash-arch.bmp" "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  install -Dm644 "$srcdir/systemd-sysusers.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-sysusers.hook"
  install -Dm644 "$srcdir/systemd-tmpfiles.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-tmpfiles.hook"

  # delete systemd-udev so we can install eudev
  rm -r "$pkgdir"/etc/udev
  rm "$pkgdir"/usr/bin/udevadm
  rm "$pkgdir"/usr/include/libudev.h
  rm "$pkgdir"/usr/share/pkgconfig/udev.pc
  rm "$pkgdir"/usr/share/man/man5/udev.conf.5
  rm "$pkgdir"/usr/share/man/man7/udev.7
  rm "$pkgdir"/usr/share/man/man8/udevadm.8
  rm -r "$pkgdir"/usr/lib/udev
  rm "$pkgdir"/usr/lib/pkgconfig/libudev.pc
  rm "$pkgdir"/usr/lib/systemd/systemd-udevd

  # delete systemd inself
  rm "$pkgdir"/usr/lib/systemd/systemd
}

package_libusefuld() {
  pkgdesc="minimal systemd client libraries exclude libudev"
  depends=('glibc')
  optdepends=('libeudev')
  license=('GPL2')
  provides=('libsystemd.so' 'libsystemd')
  conflicts=('libsystemd.so' 'libsystemd')

  # meson does not support installing subsets of files, no?
  # So do a full install to temporary directory, then install what we need.
  DESTDIR="$srcdir"/full-install ninja -C build install

  install -dm755 "$pkgdir"/usr/lib/
  cp --archive "$srcdir"/full-install/usr/lib/lib{nss_*,systemd,udev}.so* "$pkgdir"/usr/lib/

  # delete udev library
  rm "$pkgdir"/usr/lib/libudev.so*
}


# vim: ft=sh syn=sh et
