pkgname=todo-server
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Kotlin TODO server for CLI"
arch=('x86_64')
url="https://github.com/nldk/todoServer"
license=('MIT')
depends=('java-runtime')
source=("https://github.com/nldk/todoServer/releases/download/todoServer/todo-server.jar"
        "https://github.com/nldk/todoServer/releases/download/todoServer/todo-server.service")
sha256sums=('SKIP' 'SKIP')  # Replace with actual hashes

package() {
    # Install JAR
    install -Dm755 "${srcdir}/todo-server.jar" "${pkgdir}/opt/todo-server/todo-server.jar"

    # Install systemd service
    install -Dm644 "${srcdir}/todo-server.service" "${pkgdir}/usr/lib/systemd/system/todo-server.service"

    # Create runtime directories
    install -d -m 750 "${pkgdir}/var/lib/todo-server"
    install -d -m 750 "${pkgdir}/var/log"

    # Create a message file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.txt" << 'EOF'
===================================================================
TODO Server installation complete!

To finish setup, run the following commands:

1. Create a dedicated system user:
   sudo useradd --system --shell /usr/bin/nologin todo

2. Create runtime directories and set ownership:
   sudo mkdir -p /var/lib/todo-server
   sudo chown -R todo:todo /var/lib/todo-server

3. Reload systemd and enable the service:
   sudo systemctl daemon-reload
   sudo systemctl enable --now todo-server.service

You can check the status with:
   sudo systemctl status todo-server.service

Logs are located at: /var/log/todo-server.log
===================================================================
EOF
cat ${pkgdir}/usr/share/doc/${pkgname}/INSTALL.txt
}
