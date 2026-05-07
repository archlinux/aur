pkgname=archshield-pro
pkgver=2.0.0
pkgrel=1
pkgdesc="Enterprise-grade Network Intrusion Detection and Prevention System (IDS/IPS)"
arch=("x86_64")
url="https://github.com/ViniciusPHDU20/ArchShield"
license=("GPL3")
depends=("python" "python-scapy" "python-scikit-learn" "python-fastapi" "python-uvicorn" "python-pyjwt" "python-pydantic-settings" "python-httpx" "python-joblib" "python-numpy" "whois" "iptables")
source=("git+https://github.com/ViniciusPHDU20/ArchShield.git#branch=master")
sha256sums=("SKIP")

package() {
  cd ArchShield

  # Diretório de instalação do projeto
  install -d "$pkgdir/opt/$pkgname"
  
  # Copiando os arquivos vitais
  cp -r api core utils templates main.py "$pkgdir/opt/$pkgname/"
  
  # Configurando permissões
  chmod 755 "$pkgdir/opt/$pkgname/main.py"

  # Criando link simbólico para execução global
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/main.py" "$pkgdir/usr/bin/archshield-pro"

  # Criando diretório de dados
  install -d "$pkgdir/opt/$pkgname/data"
  chmod 777 "$pkgdir/opt/$pkgname/data"
  
  # Serviço Systemd
  install -d "$pkgdir/usr/lib/systemd/system"
  cat <<EOF > "$pkgdir/usr/lib/systemd/system/archshield.service"
[Unit]
Description=ArchShield PRO - Sovereign IDS/IPS
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/$pkgname
ExecStart=/usr/bin/python3 /opt/$pkgname/main.py
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
}
