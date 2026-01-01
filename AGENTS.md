# AGENTS.md

Guia rápido para manutenção quando uma atualização do Dwarf Fortress quebrar a tradução.

## Objetivo
Reaplicar a tradução PT-BR automaticamente no `/opt/dwarffortress` usando `dwarffortress-ptbr-apply`.

## Diagnóstico rápido
- Verifique a versão instalada:
  ```bash
  pacman -Qi dwarffortress | rg -i 'Vers[ãa]o|Version'
  ```
- Teste o aplicador:
  ```bash
  sudo dwarffortress-ptbr-apply
  ```

## Verificação rápida (aplicação OK)
```bash
ls -l /opt/dwarffortress/libdfhooks_dfint.so /opt/dwarffortress/libdfhooks.so
ls -l /opt/dwarffortress/dfint-data/dictionary.csv
ls -l ~/.local/share/dwarffortress/dfint-data
ls -l ~/.local/share/dwarffortress/dwarfort
rg -n "dicion[aã]rio" /opt/dwarffortress/dfint-data/dictionary.csv | head -n 3
```

## Se falhar com “no hook metadata found”
Isso indica que ainda não existe offsets para essa versão em `hook_v2.json`.

Passos:
1) Verifique se já existe offsets para essa versão:
   ```bash
   curl -L https://dfint.github.io/update-data/metadata/hook_v2.json | rg -n "<VERSAO>_.*linux64"
   ```
2) Se existir, rode novamente:
   ```bash
   sudo dwarffortress-ptbr-apply --version <VERSAO>
   ```

## Fallback manual (GUI)
Se o metadata ainda não tiver offsets:
```bash
sudo -E dfint-installer
```
Selecione `/opt/dwarffortress/dwarfort` e aplique **Portuguese (Brazil)**.

## Forçar versão manualmente
```bash
sudo dwarffortress-ptbr-apply --version <VERSAO>
```

## Ajuste de idioma
```bash
sudo dwarffortress-ptbr-apply --lang pt-BR
```

## Arquivos instalados
- `/usr/bin/dwarffortress-ptbr-apply`
- `/usr/share/libalpm/hooks/dwarffortress-ptbr.hook`

## Teste local (sem mexer em /opt)
```bash
mkdir -p ~/tmp-df-test
./dwarffortress-ptbr-apply --df-dir ~/tmp-df-test --version <VERSAO>
find ~/tmp-df-test -maxdepth 3 -type f | sort
rm -rf ~/tmp-df-test
```

## Quando atualizar o pacote AUR
```bash
makepkg -si
```
