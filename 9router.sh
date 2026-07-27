#!/bin/bash
# 9Router WebUI Launcher

# Set up directories
export DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/9router"
export CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/9router"
mkdir -p "$DATA_DIR" "$CONFIG_DIR"

ENV_FILE="$CONFIG_DIR/.env"
PORT=${PORT:-20128}

# Interactive setup on first run
if [ ! -f "$ENV_FILE" ]; then
    echo "🔧 First run: Setting up 9Router configuration..."
    echo ""
    echo "📋 Please answer the following questions:"
    echo ""
    read -p "▶️  Enter port for 9Router [default: 20128]: " input_port
    PORT=${input_port:-20128}
    echo ""
    echo "🔑 Free AI providers available without API keys:"
    echo "   - Kiro AI (free, limited requests)"
    echo "   - OpenCode Free (free, limited requests)"
    echo "   - Gemini Free (limited, requires Google account)"
    echo ""
    read -p "▶️  Do you want to enable free providers? (y/n) [default: y]: " enable_free
    ENABLE_FREE=${enable_free:-y}
    echo ""
    echo "🔐 If you have API keys for paid services, you can add them later."
    echo "   Supported: OpenAI, Anthropic, Google, DeepSeek, Groq, Cohere, and more."
    echo ""
    read -p "▶️  Continue with setup? (y/n) [default: y]: " continue_setup
    CONTINUE_SETUP=${continue_setup:-y}
    if [[ "$CONTINUE_SETUP" =~ ^[Yy]$ ]]; then
        cat > "$ENV_FILE" <<EOL
# 9Router Configuration
# Generated on $(date)

PORT=$PORT
NODE_ENV=production
DATA_DIR=$DATA_DIR
NEXT_PUBLIC_BASE_URL=http://localhost:$PORT
OPEN_KIRO_AI=${ENABLE_FREE,,}
OPEN_OPECODE_FREE=${ENABLE_FREE,,}

# Add your API keys below:
# OPENAI_API_KEY=sk-...
# ANTHROPIC_API_KEY=sk-...
# GOOGLE_API_KEY=...
# GROQ_API_KEY=...
# DEEPSEEK_API_KEY=...
EOL
        echo ""
        echo "✅ Configuration saved to: $ENV_FILE"
        echo ""
        echo "💡 You can edit this file later to add API keys:"
        echo "   $EDITOR $ENV_FILE"
    else
        echo "⚠️  Setup cancelled. Run '9router' again to complete setup."
        exit 1
    fi
fi

# Load configuration
if [ -f "$ENV_FILE" ]; then
    set -a
    source "$ENV_FILE"
    set +a
fi

export PORT=${PORT:-20128}
export DATA_DIR=${DATA_DIR:-$HOME/.local/share/9router}

# Check if the user wants to run in service mode (for systemd)
if [[ "$1" == "--service" ]]; then
    # Run in background without interactive menu
    exec /usr/bin/bun /usr/lib/node_modules/9router/cli.js --skip-update
else
    # Run interactively (shows the menu)
    exec /usr/bin/bun /usr/lib/node_modules/9router/cli.js --skip-update
fi
