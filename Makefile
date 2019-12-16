SHELL:=/bin/bash
.PHONY: clean
clean:
				sudo pacman -R arangodb
				sudo rm -rf /var/log/arangodb3
				sudo rm -rf /var/lib/arangodb3-apps
				sudo rm -rf /var/lib/arangodb3
