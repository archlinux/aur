# ============================================================
# ~/.zshrc — zsh config without oh-my-zsh  |  Arch Linux
# Prompt: Starship  |  install: yay -S starship
# ============================================================


# ------------------------------------------------------------
# HISTORY
# ------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY


# ------------------------------------------------------------
# COMPLETION
# ------------------------------------------------------------
#autoload -Uz compinit && compinit
#zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# ------------------------------------------------------------
# KEYBINDINGS
# ------------------------------------------------------------
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# ------------------------------------------------------------
# PLUGINS
# ------------------------------------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ------------------------------------------------------------
# PROMPT — Starship (auto-creates starship.toml if needed)
# ------------------------------------------------------------
if command -v starship &>/dev/null; then
    mkdir -p ~/.config
    if [ ! -f ~/.config/starship.toml ]; then
        echo 'scan_timeout = 100' > ~/.config/starship.toml
    elif ! grep -q 'scan_timeout' ~/.config/starship.toml; then
        echo 'scan_timeout = 100' >> ~/.config/starship.toml
    fi
    eval "$(starship init zsh)"
fi


# ------------------------------------------------------------
# STARTUP — set terminal size, then fastfetch + df
#
# Escape sequence: \033[8;{rows};{cols}t
#   \033[8;38;120t  →  120 columns wide, 38 rows tall
#
# To maximize instead, replace with: printf '\033[9;1t'
# Guarded against SSH sessions (resize won't work over SSH)
# ------------------------------------------------------------
if command -v fastfetch &>/dev/null; then
    [ -z "$SSH_CONNECTION" ] && printf '\033[8;38;120t'   # <-- COLS=120  ROWS=38  (edit here)
    sleep 0.1
    fastfetch
    df -h | grep Filesystem
    df -h | grep /dev/sd
    echo
fi
