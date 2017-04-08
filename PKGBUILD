# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=doom3-lms
pkgver=4.0
pkgrel=1
pkgdesc="Doom 3 Last Man Standing. A coop mod for Doom 3."
url="http://doom3coop.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('doom3')
makedepends=('unzip')
backup=("opt/doom3/lms/cdoomcoopserver.cfg" \
        "opt/doom3/lms/lmsmodserver.cfg" \
        "opt/doom3/lms/roecoopserver.cfg" \
        "opt/doom3/lms/spcoopserver.cfg")
source=('doom3-lms.desktop' 'doom3-lms.xpm' \
'http://www.slashbunny.com/aur/doom3-lms/lastmanstandingcoop4multiplatform.zip')
sha256sums=('ac3e7cceaecc26e45051af2f72d04cdf0ec2afcee32283053b4e751dca67ccaa'
            '925893e8dee7e4d7834e1760923a7e954780e568157920d5b6014b739b627799'
            '3e88196efc60a9046b9518a249c99021aca1c6341c654129a772b1f28f04c37e')
PKGEXT='.pkg.tar'

build() {
    cd $startdir/src/lms4/

    # Create Destination Directories
    install -d $startdir/pkg/{usr/bin/,opt/doom3/}

    # Modify Windows .bat Files to Linux .sh Files and Rename
    for i in *.bat;
    do
        # Modify File
        /bin/sed -i 's:cd..:#!/bin/bash \n\ncd "/opt/doom3"\n:g' $i
        /bin/sed -i 's:doom3.exe:./doom.x86:g' $i
        echo -e " \$* \rexit $?\r" >> $i

        # Install File
        install -D -m 755 $i $startdir/src/lms4/`basename $i .bat`.sh
    done

    # Remove Unneeded Files
    rm $startdir/src/lms4/{*.bat,*.url,lms.ico,Lms2.ico,docs/*.url}

    # Install Data Files
    mv $startdir/src/lms4 $startdir/pkg/opt/doom3/

    # Install Icon
    install -D -m 644 $startdir/src/doom3-lms.xpm \
        $startdir/pkg/usr/share/pixmaps/doom3-lms.xpm

    # Install Desktop File
    install -D -m 644 $startdir/src/doom3-lms.desktop \
        $startdir/pkg/usr/share/applications/doom3-lms.desktop

    # Create Main Launcher Shortcut
    ln -s /opt/doom3/lms4/LMS4.sh $startdir/pkg/usr/bin/doom3-lms
}
