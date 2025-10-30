# Maintainer: honjow
# shellcheck disable=SC2034
pkgname=sk-chos-addon
_basename=sk-chos-tool
_reponame=sk-chos-config
_pkgname=${pkgname}
pkgver=2.9.3
pkgrel=1
pkgdesc="Addon for sk-chimeros"
arch=('any')
url="https://github.com/honjow/sk-chos-config.git"
license=('MIT')
makedepends=('git')
depends=(
    amd-debug-tools
    cage
    expect
    efibootmgr
    ethtool
    fakeroot
    fpaste
    fzf
    glow
    gnu-efi
    gum
    just
    libcec
    man-db
    python-systemd
    refind
    wlr-randr
    zram-generator
)
optdepends=(
    plymouth
)
provides=(sk-chos-addon)
conflicts=(sk-chos-addon-git)
replaces=(sk-chos-addon-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/honjow/sk-chos-config/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!strip)
backup=('etc/sk-chos-tool/github_cdn.conf')
install=sk-chos-addon.install

prepare() {
    source_dir="${srcdir}/${_reponame}-${pkgver}/src/chimeraos-addon"
    cd "${source_dir}/share/sk-chos/completions"
    ./gen.sh
}

package() {
    source_dir="${srcdir}/${_reponame}-${pkgver}/src/chimeraos-addon"

    # bin
    install -dm755 "${pkgdir}/usr/bin/"
    install -m755 -t "${pkgdir}/usr/bin/" "${source_dir}/bin"/*
    # 复制软链接 覆盖
    find "${source_dir}/bin" -maxdepth 1 -type l -exec cp -P -f {} "${pkgdir}/usr/bin/" \;

    # conf
    install -dm755 "${pkgdir}/etc/${_basename}"
    install -m644 -t "${pkgdir}/etc/${_basename}" "${source_dir}/etc/${_basename}"/*.conf

    # fonts conf
    install -dm755 "${pkgdir}/etc/fonts/conf.d"
    install -m644 -t "${pkgdir}/etc/fonts/conf.d" "${source_dir}/etc/fonts/conf.d"/*.conf

    # sk-chos
    install -dm755 "${pkgdir}/etc/sk-chos"
    install -m644 -t "${pkgdir}/etc/sk-chos" "${source_dir}/etc/sk-chos"/*

    # sysctl
    install -dm755 "${pkgdir}/etc/sysctl.d"
    install -m644 -t "${pkgdir}/etc/sysctl.d" "${source_dir}/etc/sysctl.d"/*

    # etc systemd
    install -dm755 "${pkgdir}/etc/systemd"
    install -m644 -t "${pkgdir}/etc/systemd" "${source_dir}/etc/systemd"/*.*

    # etc system
    install -dm755 "${pkgdir}/etc/systemd/system"
    install -m644 -t "${pkgdir}/etc/systemd/system" "${source_dir}/etc/systemd/system"/*.*

    # lib service
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    # install -m644 -t "${pkgdir}/usr/lib/systemd/system" "${source_dir}/systemd/system"/*.*
    find "${source_dir}/systemd/system" -maxdepth 1 -type f -exec install -m644 -D {} "${pkgdir}/usr/lib/systemd/system/" \;
    install -dm755 "${pkgdir}/usr/lib/systemd/system/hhd@.service.d"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system/hhd@.service.d" "${source_dir}/systemd/system/hhd@.service.d"/*
    install -dm755 "${pkgdir}/usr/lib/systemd/system/hhd.service.d"
    install -m644 -t "${pkgdir}/usr/lib/systemd/system/hhd.service.d" "${source_dir}/systemd/system/hhd.service.d"/*

    # user service
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    install -m644 -t "${pkgdir}/usr/lib/systemd/user" "${source_dir}/systemd/user"/*

    # /usr/libexec/*
    install -dm755 "${pkgdir}/usr/libexec"
    install -m755 -t "${pkgdir}/usr/libexec" "${source_dir}/libexec"/*

    # /etc/default/*
    install -dm755 "${pkgdir}/etc/default"
    install -m644 -t "${pkgdir}/etc/default" "${source_dir}/etc/default"/*

    # etc profile.d
    install -dm755 "${pkgdir}/etc/profile.d"
    install -m644 -t "${pkgdir}/etc/profile.d" "${source_dir}/etc/profile.d"/*

    # plymouthd.conf
    install -dm755 "${pkgdir}/etc/plymouth"
    cp -r "${source_dir}/etc/plymouth"/* "${pkgdir}/etc/plymouth"

    # /usr/share/sk-chos/just/*
    install -dm755 "${pkgdir}/usr/share/sk-chos/just"
    install -m644 -t "${pkgdir}/usr/share/sk-chos/just" "${source_dir}/share/sk-chos/just"/*.*

    # /usr/share/sk-chos/motd/*
    install -dm755 "${pkgdir}/usr/share/sk-chos/motd"
    install -m644 -t "${pkgdir}/usr/share/sk-chos/motd" "${source_dir}/share/sk-chos/motd"/*

    # /usr/share/sk-chos/*
    install -dm755 "${pkgdir}/usr/share/sk-chos"
    install -m644 -t "${pkgdir}/usr/share/sk-chos" "${source_dir}/share/sk-chos"/justfile

    # /usr/local/share/zsh/site-functions/*
    install -dm755 "${pkgdir}/usr/local/share/zsh/site-functions"
    install -m644 -t "${pkgdir}/usr/local/share/zsh/site-functions" "${source_dir}/share/sk-chos/completions/"_*just

    # /etc/bash_completion.d
    install -dm755 "${pkgdir}/etc/bash_completion.d"
    install -m644 "${source_dir}/share/sk-chos/completions/_just.bash" "${pkgdir}/etc/bash_completion.d/just.bash"

    # /usr/lib/cjust
    install -dm755 "${pkgdir}/usr/lib/cjust"
    install -m755 -t "${pkgdir}/usr/lib/cjust" "${source_dir}/lib/cjust"/*.sh

    # /usr/lib/os-*
    install -dm755 "${pkgdir}/usr/lib"
    install -m755 -t "${pkgdir}/usr/lib" "${source_dir}/lib/os-"*

    # polkit actions
    install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
    install -m644 -t "${pkgdir}/usr/share/polkit-1/actions" "${source_dir}/share/polkit-1/actions"/*

    # polkit rules
    install -dm755 "${pkgdir}/usr/share/polkit-1/rules.d"
    install -m644 -t "${pkgdir}/usr/share/polkit-1/rules.d" "${source_dir}/share/polkit-1/rules.d"/*

    # udev rules
    install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
    install -m644 -t "${pkgdir}/usr/lib/udev/rules.d" "${source_dir}/lib/udev/rules.d"/*

    # /usr/share/plymouth/themes
    install -dm755 "${pkgdir}/usr/share/plymouth/themes"
    cp -r "${source_dir}/share/plymouth/themes"/* "${pkgdir}/usr/share/plymouth/themes/"

    # 创建软链接解决重命名兼容
    # bin
    cd "${pkgdir}/usr/bin"
    ln -s sk-first-setup sk-first-run
    ln -s sk-chos-tool-update skt-update

    # systemd/system
    cd "${pkgdir}/usr/lib/systemd/system"
    ln -s sk-setup-kernel-options.service sk-update-boot-entry.service
    ln -s sk-setup-next-boot.service sk-auto-keep-boot-entry.service

    # systemd/user
    cd "${pkgdir}/usr/lib/systemd/user"
    ln -s sk-first-setup-daemon.service sk-first-run-daemon.service
}
