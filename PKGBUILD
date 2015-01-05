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
#
# Warning: some builds not up-to-date: x86_64: 5.20150205, i686: 5.20150205, armv6h: 5.20150130


pkgname=git-annex-bin
pkgver=5.20150205
pkgrel=2
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
depends=('coreutils' 'curl' 'git' 'gnupg' 'lsof' 'rsync' 'bash' 'openssh' 'wget' 'findutils' 'dnsutils')

if [[ $CARCH == "x86_64" ]] ; then
    _file=git-annex-standalone-amd64-${pkgver}.tar.gz
    source+=("${_file}::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz")
    sha256sums+=('6598df34cd0381288b609c137c5dbb07d4bd833ed9917d5d961e62b62c1652f8')
elif [[ $CARCH == "i686" ]] ; then
    _file=git-annex-standalone-i386-${pkgver}.tar.gz
    source+=("${_file}::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-i386.tar.gz")
    sha256sums+=('c4660ce7ef68138a808c711452f024fd735921b772abfb8a1cf9ae1b045d52b6')
elif [[ $CARCH == "armv6h" ]] ; then
    _file=git-annex-standalone-armel-${pkgver}.tar.gz
    source+=("${_file}::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-armel.tar.gz")
    sha256sums+=('2426cdfc263036f0d7f76f0a00487b5230ebfb3a71ffa0336a34bd4187287947')
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
