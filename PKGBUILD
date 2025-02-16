# Maintainer: refrigerador67
# Maintainer: nixietab

pkgname=picodulce
pkgver=0.12
pkgrel=2
pkgdesc="Launcher for Minecraft based on the picomc library"
arch=('x86_64')
OPTIONS=(!strip !docs libtool emptydirs)
url="https://github.com/nixietab/picodulce"
license=('MIT')  # Replace with your project's license
depends=('python' 'python-virtualenv' 'xdg-utils')
check=('jdk17-openjdk' 'jdk8-openjdk' 'jdk21-openjdk')
makedepends=('git')
source=("git+https://github.com/nixietab/picodulce.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    # Create a directory for the application in the user's home directory
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # Copy all project files to the created directory
    cp -r . "$pkgdir/usr/share/$pkgname"

    # Create a virtual environment
    python -m venv "$pkgdir/usr/share/$pkgname/venv"

    # Activate the virtual environment and install dependencies
    source "$pkgdir/usr/share/$pkgname/venv/bin/activate"
    pip install -r requirements.txt

    # Create a run.sh script
    install -Dm755 /dev/stdin "$pkgdir/usr/share/$pkgname/run.sh" <<EOF
#!/bin/bash

if [ ! -d "venv" ]; then
  echo "venv folder does not exist. Creating virtual environment..."
  python3 -m venv venv

  source venv/bin/activate

  echo "Installing required packages..."
  pip install -r requirements.txt
else
  source venv/bin/activate
fi

python picodulce.py
EOF


    # Make the run.sh script executable
    chmod +x "$pkgdir/usr/share/$pkgname/run.sh"

    # Create a desktop entry for the application
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Picodulce
Path=/usr/share/picodulce
Exec=/usr/share/picodulce/run.sh
Icon=/usr/share/picodulce/launcher_icon.ico
Terminal=true
Type=Application
Comment=Picodulce Launcher
Categories=Game;
EOF

    # Ensure the normal user has permission to write to the picodulce folder
    chown -R "$USER:$USER" "$pkgdir/usr/share/$pkgname"
    chmod -R u+w "$pkgdir/usr/share/$pkgname"

    #Install into bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/picodulce" <<EOF
#!/bin/bash
cd /usr/share/picodulce/
exec ./run.sh
EOF
}
# vim:set ts=2 sw=2 et:
