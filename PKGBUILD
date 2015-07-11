# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Jon <jonathan.stott@gmail.com>
# Contributor: <dev@chimeracoder.net>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Sairon Istyar <saironiq@gmail.com>
# Contributor: Andreas B. Wagner <andreasbwagner@pointfree.net>
# Contributor: Samuel Tardieu <sam@rfc1149.net>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/git-annex-bin

pkgname=git-annex-bin
pkgver=5.20150710
pkgrel=1
pkgdesc='Standalone precompiled version of git-annex with no Haskell dependencies, batteries included.'
arch=('i686' 'x86_64' 'armv6h')
url='http://git-annex.branchable.com/'
license=('GPL3')
provides=('git-annex')
conflicts=('git-annex', 'git-annex-git')
replaces=('git-annex-standalone')
source=('git-annex' 'runshell.patch')
sha256sums=('c7d12ba3f3a00736d0d22e18e76721314d461561adcf48cbd102413e5e75be92'
            '173b3f0dc5a314559574113a2cc1242b61ff7caebbd3be52d3090b7a91e1268f')

# binaries to remove from resulting standalone package
_rmbin=('cp' 'curl' 'git' 'gpg' 'lsof' 'rsync' 'sh' 'sha1sum' 'sha224sum' \
        'sha256sum' 'sha384sum' 'sha512sum' 'ssh' 'wget' 'xargs' \
        'ssh-keygen' 'tar' 'git-shell' 'git-upload-pack' 'git-receive-pack' 'gunzip' )

# all of these can be left out if not deleting $_rmbin binaries
depends=('coreutils' 'curl' 'git' 'gnupg' 'lsof' 'rsync' 'bash' 'openssh' 'wget' 'findutils' 'dnsutils' 'aria2')

if [[ $CARCH == "x86_64" ]] ; then
    _file=git-annex-standalone-amd64-${pkgver}.tar.gz
    source+=("${_file}::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz")
    sha256sums+=('be3f0f2a4a317bf9ee24db82821dd147e1ab9a1c6f0fbfae4a36aee6a22bbfce')
elif [[ $CARCH == "i686" ]] ; then
    _file=git-annex-standalone-i386-${pkgver}.tar.gz
    source+=("${_file}::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-i386.tar.gz")
    sha256sums+=('8901ab302b3bbbacea11b34a1213487b1d2c1f1b7742f220fb743b644ea84362')
elif [[ $CARCH == "armv6h" ]] ; then
    _file=git-annex-standalone-armel-${pkgver}.tar.gz
    source+=("${_file}::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz")
    sha256sums+=('9e3116ae104e81784579907f47e30e1661b0eeb768533be120151b9ee704e658')
fi

package() {
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"

    cp -a "$srcdir/git-annex.linux" "$pkgdir/opt/"

    patch "$pkgdir/opt/git-annex.linux/runshell" "$srcdir/runshell.patch"

    for file in ${_rmbin[@]} ; do
        msg "  Removing $file from executables..."
        find "$pkgdir/opt/git-annex.linux/bin/" -name "$file" -executable -delete
        find "$pkgdir/opt/git-annex.linux/shimmed/" -name "$file" -delete
    done

    msg "  Removing git-core componets from executables..."
    find "$pkgdir/opt/git-annex.linux/git-core/" -executable \
        -execdir test -e ../shimmed/{} \; \
        -execdir rm -r ../shimmed/{} \;
    rm -r "$pkgdir"/opt/git-annex.linux/git-core

    msg "  Removing runshell componets from executables..."
    rm "$pkgdir"/opt/git-annex.linux/git{,-receive-pack,-upload-pack,-shell}

    # 64-bit curl fix (endless loop in assistant when creating new repo - incompatible curl bin (system) and lib (package))
    if [[ $CARCH == "x86_64" ]] ; then
        rm "$pkgdir/opt/git-annex.linux/usr/lib/x86_64-linux-gnu/libcurl.so.4"
    fi

    # move the man pages over to the system directory
    mv "$pkgdir/opt/git-annex.linux/usr/share" "$pkgdir/usr/"
    gzip -9 "$pkgdir/usr/share/man/man1/git-annex.1"
    gzip -9 "$pkgdir/usr/share/man/man1/git-annex-shell.1"

    cp "$srcdir/git-annex" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/git-annex"
    ln -s git-annex "$pkgdir/usr/bin/git-annex-webapp"
    ln -s git-annex "$pkgdir/usr/bin/git-annex-shell"
}
